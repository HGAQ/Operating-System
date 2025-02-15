#ifndef __SYSNUM_H
#define __SYSNUM_H

// System call numbers
#define SYS_fork         1
#define SYS_exit         2
#define SYS_wait         3
#define SYS_pipe         4
#define SYS_read         5
#define SYS_kill         6
#define SYS_exec         7
#define SYS_fstat        8
#define SYS_chdir        9
#define SYS_dup         10
#define SYS_getpid      11
#define SYS_sbrk        12
#define SYS_sleep       13
#define SYS_uptime      14
#define SYS_open        15
#define SYS_write       16
#define SYS_remove      177//rep
#define SYS_trace       18
#define SYS_sysinfo     19
#define SYS_mkdir       20
#define SYS_close       21
#define SYS_test_proc   22
#define SYS_dev         233//rep
#define SYS_readdir     244//rep
#define SYS_getcwd      25
#define SYS_rename      26

#define SYS_poweroff    210
#define SYS_write_      64
#define SYS_exit_       93


#define SYS_brk         214
#define SYS_mkdirat     34
#define SYS_chdir_      49
#define SYS_clone       220
#define SYS_wait4       260
#define SYS_openat      56
#define SYS_close_      57
#define SYS_dup_        23
#define SYS_dup3        24
#define SYS_getcwd_     17
#define SYS_execve      221
#define SYS_fstat_      80
#define SYS_getdents64  61
#define SYS_getpid_     172
#define SYS_getppid     173
#define SYS_gettimeofday 169
#define SYS_mmap        222
#define SYS_munmap      215
#define SYS_read_       63
#define SYS_pipe2       59
#define SYS_nanosleep   101
#define SYS_times       153
#define SYS_mount       40
#define SYS_umount2     39
#define SYS_uname       160
#define SYS_unlinkat    35
#define SYS_sched_yield 124
#endif