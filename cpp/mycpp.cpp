#include "stm32.h"

int print(int i)
{
  i+=1;
}

int print(char c)
{
 c-=1;
}


int mymain(void)
{
  print(35);
  print('A');
  return 0;
}

