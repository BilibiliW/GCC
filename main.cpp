#include <stdio.h>
#include "dirlib/add.h"
#include "dirlib/swap.h"

int Max(int a, int b){
	return a>b?a:b;
}
int main(void){
	int a=1, b=2;
	printf("a=%d  b=%d\n",a,b);
	swap_(a,b);
	printf("a=%d  b=%d\n",a,b);
	int sum=add(a,b);
	printf("sum=%d\n",sum);
	int max=Max(a,b);
	printf("max=%d\n",max);
	
}

