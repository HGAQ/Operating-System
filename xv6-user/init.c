#include "kernel/include/types.h"
#include "kernel/include/stat.h"
#include "kernel/include/file.h"
#include "kernel/include/fcntl.h"
#include "kernel/include/sbi.h"
#include "xv6-user/user.h"


char *argv[] = {0};
char *tests[] = {
 "brk",                 //1/3
 "chdir",               //2/3
 "clone",               ////////////////////////////////
 "close",               ////////////////////////////////
 "dup",                 ///////////////////////////////
 "dup2",                //1/2
 "execve",              ////////////////////////////////////
 "exit",                //1/2
 "fork",                ///////////////////////////////////
 "fstat",               //
 "getcwd",              //
 "getdents",            //
 "getpid",              //
 "getppid",             //
 "gettimeofday",        //
 "mkdir_",              //
 "mmap",                //
 "mount",               //
 "munmap",              //
 "open",                //
 "openat",              //
 "pipe",                //
 "read",                //
 "sleep",               //
 "test_echo",           //
 "times",               //
 "umount",              //
 "uname",               //
 "unlink",              //
 "wait",                //
 "write",               //////////////////////////////////////
 "yield",               //
 "waitpid",             //
};
int counts = sizeof(tests) / sizeof((tests)[0]);
int main(void) {
  int pid=0, wpid=0;
  dev(O_RDWR, CONSOLE, 0);
  dup(0); // stdout
  dup(0); // stderr

  for (int i = 0; i < counts; i++) {
    //printf("====================================starting %s\n", tests[i]);
    pid = fork();
    if (pid < 0) {
      printf("init: fork failed\n");
      exit(1);
    }
    if (pid == 0) {
      exec(tests[i], argv);
      printf("init: exec %s",tests[i]);
      printf(tests[i]);
      printf(" failed exec %s\n", tests[i]);
      exit(1);
    }
    else{
      wait((int*)0);
    }
  }
  for(;;){
    wpid = wait((int *) 0);
    if(wpid == pid){
      // the shell exited; restart it.
      break;
    } else if(wpid < 0){
      printf("init: wait returned\n");
      exit(-1);
    } else {
      // it was a parentless process; do nothing.
    }
  }
  exit(-1);
  return 0;
}

