#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <constants.h>

volatile bram_channel *bram_chnl = (bram_channel *) SHARED_BRAM_BASE;

void foo()
{
	int a = 10;
	a = a * a;

}
int main()
{
	while(1)
	{
		if (bram_chnl->input_available == 1)
		{
			bram_chnl->input_available += 98;
		}
	}
}
