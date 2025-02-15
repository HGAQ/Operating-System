//
// Support functions for system calls that involve file descriptors.
//


#include "include/types.h"
#include "include/riscv.h"
#include "include/param.h"
#include "include/spinlock.h"
#include "include/sleeplock.h"
#include "include/fat32.h"
#include "include/file.h"
#include "include/pipe.h"
#include "include/stat.h"
#include "include/proc.h"
#include "include/printf.h"
#include "include/string.h"
#include "include/vm.h"

struct devsw devsw[NDEV];
struct {
  struct spinlock lock;
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
  initlock(&ftable.lock, "ftable");
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    memset(f, 0, sizeof(struct file));
  }
  #ifdef DEBUG
  printf("fileinit\n");
  #endif
}

// Allocate a file structure.
struct file*
filealloc(void)
{
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
  return NULL;
}

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
  f->ref++;
  release(&ftable.lock);
  return f;
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE){
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    eput(ff.ep);
  } else if (ff.type == FD_DEVICE) {

  }
}

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();
  struct stat st;
  
  if(f->type == FD_ENTRY){
    elock(f->ep);
    estat(f->ep, &st);
    eunlock(f->ep);
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
      return -1;
    return 0;
  }
  return -1;
}

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
  int r = 0;

  if(f->readable == 0)
    return -1;

  switch (f->type) {
    case FD_PIPE:
        r = piperead(f->pipe, addr, n);
        break;
    case FD_DEVICE:
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
          return -1;
        r = devsw[f->major].read(1, addr, n);
        break;
    case FD_ENTRY:
        elock(f->ep);
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
  }

  return r;
}

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
  int ret = 0;

  if(f->writable == 0)
    return -1;

  if(f->type == FD_PIPE){
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    elock(f->ep);
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    }
    eunlock(f->ep);
  } else {
    panic("filewrite");
  }

  return ret;
}

// Read from dir f.
// addr is a user virtual address.
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    return -1;

  struct dirent de;
  struct stat st;
  int count = 0;
  int ret;
  elock(f->ep);
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    f->off += count * 32;
  }
  eunlock(f->ep);
  if (ret == -1)
    return 0;

  f->off += count * 32;
  estat(&de, &st);
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
}

//////////////////////////////////////////////////

//int dirnext_(struct file *f, uint64 buffer, int len){
//  
//  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
//    return -1;
//
//  struct dirent de;
//  struct __dirent__ de_;
//  int count = 0;
//  int ret_size = len;
//  int ret;
//  elock(f->ep);
//  while(1){
//    de_.d_off = f-> off;
//    ret = enext(f->ep, &de, f->off, &count);
//    f->off += count * 32;
//    if(ret == 0) {
//      continue;
//    }
//    if(ret == -1) {
//      return 0;
//    }
//    copyout3(de_.d_name, de.filename, sizeof(de.filename));
//    if(de.attribute & ATTR_DIRECTORY){
//      de_.d_type = T_DIR;
//    } else{
//      de_.d_type = T_FILE;
//    }
//    de_.d_ino = 0;
//    int size = sizeof(struct __dirent__) - sizeof(de_.d_name) + strlen(de_.d_name) + 1;
//    size += (sizeof(uint64) - (size % sizeof(uint64))) % sizeof(uint64); // Align to 8.
//    de_.d_reclen = size;
//    if(de_.d_reclen > len){
//      break;
//    }
//    if(copyout2(buffer, (char *)&de_, sizeof(de_.d_reclen)) < 0)
//      return -1;
//    buffer += de_.d_reclen;
//    len -= de_.d_reclen;
//  }
//  eunlock(f->ep);
//  f->off += count * 32;
//  return ret_size - len;
//}

int dirnext_(struct file *f, uint64 buffer, int len){
  struct __dirent__ *buf = (struct __dirent__ *)buffer, de;

  struct dirent *ep = f->ep, *d;
  if (ep == NULL)
    return -1;

  int i = 0, sum_s = 0;
  for (d = eroot(); d->next; d = d->next)
  {
    if (d->parent == ep)
    {
      de.d_ino = (long)d->parent + d->off;
      de.d_off = d - d->next;
      de.d_reclen = sizeof(de);
      de.d_type = f->type;
      safestrcpy(de.d_name, d->filename, sizeof(d->filename));

      if (sum_s + sizeof(de) > len)
        return sum_s;
      sum_s += sizeof(de);
      buf[i++] = de;
    }
  }
  return 0;
}
/////////////////////////////////////////////////////



