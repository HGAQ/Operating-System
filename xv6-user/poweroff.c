#include "kernel/include/types.h"
#include "kernel/include/stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
  poweroff();
  exit(1); // never reached
}