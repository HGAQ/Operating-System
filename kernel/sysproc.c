
#include "include/types.h"
#include "include/riscv.h"
#include "include/param.h"
#include "include/memlayout.h"
#include "include/spinlock.h"
#include "include/proc.h"
#include "include/syscall.h"
#include "include/timer.h"
#include "include/kalloc.h"
#include "include/string.h"
#include "include/printf.h"
#include "include/sbi.h"
#include "include/vm.h"

extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
    if(i >= NELEM(argv)){
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
      goto bad;
    }
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    if(argv[i] == 0)
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);
  return -1;
}

uint64
sys_exit(void)
{
  int n;
  if(argint(0, &n) < 0)
    return -1;
  exit(n);
  return 0;  // not reached
}

uint64
sys_getpid(void)
{
  return myproc()->pid;
}

uint64
sys_fork(void)
{
  return fork();
}

uint64
sys_wait(void)
{
  uint64 p;
  if(argaddr(0, &p) < 0)
    return -1;
  return wait(p);
}

uint64
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

uint64
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

uint64
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

uint64
sys_trace(void)
{
  int mask;
  if(argint(0, &mask) < 0) {
    return -1;
  }
  myproc()->tmask = mask;
  return 0;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////


uint64
sys_brk(void){
  uint64 curr_addr;
  uint64 next_addr;
  if(argaddr(0, &next_addr) < 0)
    return -1;
  curr_addr = myproc()->sz; // Size of process memory
  printf("Running: BRK ... curr_addr: %d ... next_addr: %d\n", curr_addr, next_addr);
  if (next_addr == 0)
  {
    return curr_addr;
  }
  if (next_addr >= curr_addr)
  {
    if(growproc(next_addr - curr_addr) < 0)
      return -1;
    else return myproc()->sz;
  }
  return 0;
}


uint64
sys_clone(void){
  uint64 flag, stack;
	if (argaddr(0, &flag) < 0) 
		return -1;
	if (argaddr(1, &stack) < 0) 
		return -1;
  printf("Running: CLONE ... flag: %ld ... stack: %ld\n", flag, stack);
  if (stack != 0)
	  return clone(flag, stack);
  else
    return fork();
}

uint64
sys_wait4(void)
{
  uint64 status;
  int pid, options;
  if(argaddr(1, &status) < 0 || argint(0, &pid) < 0 || argint(2, &options) < 0){
    return -1;}
  printf("Running: WAIT4 ... pid: %ld ... options: %ld\n", pid, options);
  return waitpid(pid, status, options);
}

uint64
sys_execve(void)
{
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
    if(i >= NELEM(argv)){
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
      goto bad;
    }
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    if(argv[i] == 0)
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);
  return -1;
}

uint64
sys_getppid(void)
{
  return myproc()->parent->pid;
}

uint64
sys_gettimeofday(void){
  TimeVal tval;
	uint64 tmp_ticks = r_time();
	tval.sec = tmp_ticks / CLK_FREQ * 10;
  uint64 ptval;
  if (argaddr(0, &ptval) < 0) {
		return -1;
	}
	if (ptval && copyout2(ptval, (char*)&tval, sizeof(tval)) < 0) {
		return -1;
	}
	return 0;
}

uint64
sys_nanosleep(void){
  int n;
  uint64 req_, rem_, ticks0;
  if (argaddr(0, &req_) < 0 || argaddr(1, &rem_) < 0)
    return -1;

	struct proc *p = myproc();
  uint64 sec, usec;
	if (copyin2((char*)&sec, req_, sizeof(sec)) < 0) 
		return -1;
	if (copyin2((char*)&usec, rem_, sizeof(usec)) < 0) 
		return -1;
	n = sec * 20 + usec / 50000000;

  acquire(&p->lock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      return -1;
    }
    sleep(&ticks, &p->lock);
  }
  release(&p->lock);
  return 0;
}


uint64
sys_times(void)
{
  uint64 tms;
  argaddr(0, &tms);
  struct proc *p = myproc();
  if (tms) {
    if(copyout2(tms, (char*)&p->proc_tms, sizeof(p->proc_tms)) == -1)
      return -1;
  }
  else
    return -1;
  return r_time();
}

uint64
sys_sched_yield(void)
{
  yield();
  return 0;
}


// Power off QEMU
uint64
sys_poweroff(void)
{
  printf("Powering off...\n");
  sbi_shutdown();
  panic("sys_poweroff");
}
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

