#include "../dirlib/swap.h"

void swap_(int &a1, int &b1){
	int a=a1;
	a1=b1;
	b1=a;
}
