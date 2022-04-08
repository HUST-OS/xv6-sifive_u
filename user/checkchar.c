// Create a zombie process that
// must be reparented at exit.

#include "kernel/include/types.h"
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int
main(void)
{
  printf("begin checkchar!\n");
  while(checkchar()){
  
  }
  return 0;
}
