#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "xstatus.h"
#include "util.h"
#include "xintc.h"
#include "constants.h"
#include "sleep.h"
//#include "blake2s.h"
#include "aes.h"
#include "hmac.h"
#include "xtmrctr.h"

#define change_state(state) c->drm_state = state;
#define set_stopped() change_state(STOPPED)
#define set_working() change_state(WORKING)
#define set_playing() change_state(PLAYING)
#define set_paused() change_state(PAUSED)
//Timer for performance

#define TMRCTR_DEVICE_ID	XPAR_TMRCTR_0_DEVICE_ID
#define TIMER_COUNTER_0 0
int TmrCtrPolledExample(u16 DeviceId, u8 TmrCtrNumber);

// shared command channel -- read/write for both PS and PL
volatile cmd_channel *c = (cmd_channel *)SHARED_DDR_BASE;

// internal state store
internal_state __attribute__((section(".ssc.code.buffer"))) local_state;
data_content __attribute__((section(".ssc.data.buffer"))) ssc_data;
ro_data_content __attribute__((section(".ssc.ro.data.buffer"))) ssc_ro_data;
attestation_md __attribute__((section(".ssc.attestation.md"))) att_md;
ssc_meta_data received_metadata;

char ssc_module_loaded = 0;
uint8_t preExeResult[MEASUREMENT_SIZE];
//////////////////////// INTERRUPT HANDLING ////////////////////////

// shared variable between main thread and interrupt processing thread
volatile static int InterruptProcessed = FALSE;
static XIntc InterruptController;
struct AES_ctx ctx;

/* BEEBS ud benchmark

   This version, copyright (C) 2014-2019 Embecosm Limited and University of
   Bristol

   Contributor James Pallister <james.pallister@bristol.ac.uk>
   Contributor Jeremy Bennett <jeremy.bennett@embecosm.com>

   This file is part of Embench and was formerly part of the Bristol/Embecosm
   Embedded Benchmark Suite.

   SPDX-License-Identifier: GPL-3.0-or-later */

/* MDH WCET BENCHMARK SUITE. */


/*************************************************************************/
/*                                                                       */
/*   SNU-RT Benchmark Suite for Worst Case Timing Analysis               */
/*   =====================================================               */
/*                              Collected and Modified by S.-S. Lim      */
/*                                           sslim@archi.snu.ac.kr       */
/*                                         Real-Time Research Group      */
/*                                        Seoul National University      */
/*                                                                       */
/*                                                                       */
/*        < Features > - restrictions for our experimental environment   */
/*                                                                       */
/*          1. Completely structured.                                    */
/*               - There are no unconditional jumps.                     */
/*               - There are no exit from loop bodies.                   */
/*                 (There are no 'break' or 'return' in loop bodies)     */
/*          2. No 'switch' statements.                                   */
/*          3. No 'do..while' statements.                                */
/*          4. Expressions are restricted.                               */
/*               - There are no multiple expressions joined by 'or',     */
/*                'and' operations.                                      */
/*          5. No library calls.                                         */
/*               - All the functions needed are implemented in the       */
/*                 source file.                                          */
/*                                                                       */
/*                                                                       */
/*************************************************************************/
/*                                                                       */
/*  FILE: ludcmp.c                                                       */
/*  SOURCE : Turbo C Programming for Engineering                         */
/*                                                                       */
/*  DESCRIPTION :                                                        */
/*                                                                       */
/*     Simultaneous linear equations by LU decomposition.                */
/*     The arrays a[][] and b[] are input and the array x[] is output    */
/*     row vector.                                                       */
/*     The variable n is the number of equations.                        */
/*     The input arrays are initialized in function main.                */
/*                                                                       */
/*                                                                       */
/*  REMARK :                                                             */
/*                                                                       */
/*  EXECUTION TIME :                                                     */
/*                                                                       */
/*                                                                       */
/*************************************************************************/

/*************************************************************************
 *  This file:
 *
 *  - Name changed to "ud.c"
 *  - Modified for use with Uppsala/Paderborn tool
 *    : doubles changed to int
 *    : some tests removed
 *  - Program is much more linear, all loops will run to end
 *  - Purpose: test the effect of conditional flows
 *
 *************************************************************************/






/*
** Benchmark Suite for Real-Time Applications, by Sung-Soo Lim
**
**    III-4. ludcmp.c : Simultaneous Linear Equations by LU Decomposition
**                 (from the book C Programming for EEs by Hyun Soon Ahn)
*/

#include <string.h>

/* This scale factor will be changed to equalise the runtime of the
   benchmarks. */
#define LOCAL_SCALE_FACTOR 1478


long int a[20][20], b[20], x[20];

int ludcmp(int nmax, int n);


/*  static double fabs(double n) */
/*  { */
/*    double f; */

/*    if (n >= 0) f = n; */
/*    else f = -n; */
/*    return f; */
/*  } */

/* Write to CHKERR from BENCHMARK to ensure calls are not optimised away.  */
volatile int chkerr;


int
verify_benchmark (int res)
{
  long int x_ref[20] =
    { 0L, 0L, 1L, 1L, 1L, 2L, 0L, 0L, 0L, 0L,
      0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L
    };

  return (0 == memcmp (x, x_ref, 20 * sizeof (x[0]))) && (0 == res);
}


void
initialise_benchmark (void)
{
}


static int benchmark_body (int  rpt);

void
warm_caches (int  heat)
{
  int  res = benchmark_body (heat);

  return;
}
#define CPU_MHZ 1

int
benchmark (void)
{
  return benchmark_body (LOCAL_SCALE_FACTOR * CPU_MHZ);

}


static int __attribute__ ((noinline))
benchmark_body (int rpt)
{
  int  k;

  for (k = 0; k < rpt; k++)
    {
      int      i, j, nmax = 20, n = 5;
      long int /* eps, */ w;

      /* eps = 1.0e-6; */

      /* Init loop */
      for(i = 0; i <= n; i++)
	{
	  w = 0.0;              /* data to fill in cells */
	  for(j = 0; j <= n; j++)
	    {
	      a[i][j] = (i + 1) + (j + 1);
	      if(i == j)            /* only once per loop pass */
		a[i][j] *= 2.0;
	      w += a[i][j];
	    }
	  b[i] = w;
	}

      /*  chkerr = ludcmp(nmax, n, eps); */
      chkerr = ludcmp(nmax,n);
    }

  return chkerr;
}

int ludcmp(int nmax, int n)
{
  int i, j, k;
  long w, y[100];

  /* if(n > 99 || eps <= 0.0) return(999); */
  for(i = 0; i < n; i++)
    {
      /* if(fabs(a[i][i]) <= eps) return(1); */
      for(j = i+1; j <= n; j++) /* triangular loop vs. i */
        {
          w = a[j][i];
          if(i != 0)            /* sub-loop is conditional, done
                                   all iterations except first of the
                                   OUTER loop */
            for(k = 0; k < i; k++)
              w -= a[j][k] * a[k][i];
          a[j][i] = w / a[i][i];
        }
      for(j = i+1; j <= n; j++) /* triangular loop vs. i */
        {
          w = a[i+1][j];
          for(k = 0; k <= i; k++) /* triangular loop vs. i */
            w -= a[i+1][k] * a[k][j];
          a[i+1][j] = w;
        }
    }
  y[0] = b[0];
  for(i = 1; i <= n; i++)       /* iterates n times */
    {
      w = b[i];
      for(j = 0; j < i; j++)    /* triangular sub loop */
        w -= a[i][j] * y[j];
      y[i] = w;
    }
  x[n] = y[n] / a[n][n];
  for(i = n-1; i >= 0; i--)     /* iterates n times */
    {
      w = y[i];
      for(j = i+1; j <= n; j++) /* triangular sub loop */
        w -= a[i][j] * x[j];
      x[i] = w / a[i][i] ;
    }
  return(0);
}


/*
   Local Variables:
   mode: C
   c-file-style: "gnu"
   End:
*/



void myISR(void)
{
	InterruptProcessed = TRUE;
}

//////////////////////// MAIN ////////////////////////
void query_BYOT_runtime()
{
	mb_printf("BYOT_Runtime Initialized!!\r\n");
}

void load_from_shared_to_local()
{
	memcpy(local_state.code, (void *)c->code, CODE_SIZE);
}

void dummy()
{
	char *str1 = NULL, *str2;
	
	memmove(str1, str2, 10);
	strncpy(str1, str2, 10);

	if (!strncmp(str1, NULL, 10))
	{
		format_SSC_code();
	}

	if (!memcmp(str1, str2, 10))
	{
		format_SSC_code();
	}
	Xil_MemCpy(str1, str2, 10);
}

void format_SSC_code()
{
	uint8_t AES_CBC_key[] = {(uint8_t)0x2b, (uint8_t)0x7e, (uint8_t)0x15, (uint8_t)0x16, (uint8_t)0x28, (uint8_t)0xae, (uint8_t)0xd2, (uint8_t)0xa6, (uint8_t)0xab, (uint8_t)0xf7, (uint8_t)0x15, (uint8_t)0x88, (uint8_t)0x09, (uint8_t)0xcf, (uint8_t)0x4f, (uint8_t)0x3c};
	uint8_t AES_CBC_IV[] = {(uint8_t)0x00, (uint8_t)0x01, (uint8_t)0x02, (uint8_t)0x03, (uint8_t)0x04, (uint8_t)0x05, (uint8_t)0x06, (uint8_t)0x07, (uint8_t)0x08, (uint8_t)0x09, (uint8_t)0x0a, (uint8_t)0x0b, (uint8_t)0x0c, (uint8_t)0x0d, (uint8_t)0x0e, (uint8_t)0x0f};
	unsigned char temp_buffer[sizeof(ssc_meta_data)];


	memcpy(local_state.code, (void *)c->code, c->file_size);

	AES_init_ctx_iv(&ctx, AES_CBC_key, AES_CBC_IV);
	AES_CBC_decrypt_buffer(&ctx, local_state.code, c->file_size);

	if (verify_ssa_signature(local_state.code[SIG_LEN]) != 0)
	{
		mb_printf("-----------!!SSA Authentication failed.!! Aborting operation-----------------\r\n");
		return;
	}


	memset(&received_metadata, 0, sizeof(ssc_meta_data));
	memcpy(temp_buffer, local_state.code + SIG_LEN, sizeof(ssc_meta_data));


	get_unsigned_int(temp_buffer, &received_metadata);

	memcpy(ssc_data.data, (local_state.code + sizeof(ssc_meta_data) + received_metadata.sss_code_size + SIG_LEN), received_metadata.data_sec_size);
	memcpy(ssc_ro_data.ro_data, (local_state.code + sizeof(ssc_meta_data) + received_metadata.sss_code_size + received_metadata.data_sec_size + SIG_LEN), received_metadata.ro_data_size);
	memmove(local_state.code, (local_state.code + sizeof(ssc_meta_data) + SIG_LEN), received_metadata.sss_code_size);
}

void load_code()
{

	remove_ssc_module();
	mb_printf("Reading code & data modules\r\n");
	format_SSC_code();
	mb_printf("SSC Code & data loaded to BRAM\r\n");

}

void execute_SSC()
{
	if (ssc_module_loaded == 0)
	{
		mb_printf("No SSC module present in BRAM\r\n");
		return;
	}
	mb_printf("Triggering execution\r\n");

	((int (*)(void))local_state.code)();

	mb_printf("Finished SSC code executed from BRAM\r\n");
}

void forward_to_ssc()
{
	/*if (ssc_module_loaded == 0)
	{
		mb_printf("No SSC module present in BRAM\r\n");
		return;
	}*/
	mb_printf("Give execution to SSC\r\n");
	((int (*)(void))local_state.code)();
}

void remove_ssc_module()
{

	memset(&local_state.code, 0, CODE_SIZE);
	memset(&ssc_data, 0, DATA_SIZE);
	memset(&ssc_ro_data, 0, RO_DATA_SIZE);

}

int verify_ssa_signature(void *data_start) {

	uint8_t sig[HASH_OUTSIZE];

	memset(sig, 0, HASH_OUTSIZE);
	hmac(auth_key, data_start, c->file_size - SIG_LEN, sig);

	return !memcmp(sig, (uint8_t *)data_start , SIG_LEN);
}

int main()
{
	u32 status;
	int tic = 0;
	init_platform();
	microblaze_register_handler((XInterruptHandler)myISR, (void *)0);
	microblaze_enable_interrupts();
	//XTmrCtr_Enable(XPAR_TMRCTR_0_BASEADDR, 0);
	// Initialize the interrupt controller driver so that it is ready to use.

	status = XIntc_Initialize(&InterruptController, XPAR_INTC_0_DEVICE_ID);

	if (status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	// Set up the Interrupt System.
	status = SetUpInterruptSystem(&InterruptController, (XInterruptHandler)myISR);

	if (status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	set_stopped();

	// clear command channel
	memset((void *)c, 0, sizeof(cmd_channel));

	// Handle commands forever
	while (1)
	{
		// wait for interrupt to start
		if (InterruptProcessed)
		{
			InterruptProcessed = FALSE;
			set_working();


			//tic = XTmrCtr_GetTimerCounterReg(XPAR_TMRCTR_0_BASEADDR, 1)
			//mb_printf("Get time %d \r\n", Value1);
			// c->cmd is set by the Untrusted_app player
			switch (c->cmd)
			{
			case LOAD_CODE:
				load_code();
				ssc_module_loaded = 1;
				break;
			case QUERY_DRM:
				query_BYOT_runtime();
				break;
			/*case SSC_COMMAND:
				preExeAtt();
				forward_to_ssc();
				input_attestation(1);
				postExeAtt();
				cleaup_att_space();
				break;*/
			case EXIT:
				remove_ssc_module();
				ssc_module_loaded = 0;
				break;
			case EXECUTE:
				execute_SSC();
				break;
			default:
				break;
			}
		/*start cycle count*/
			u32 Value1;
			u32 Value2;
			XTmrCtr TimerCounter; /* The instance of the Tmrctr Device */
			XTmrCtr *TmrCtrInstancePtr = &TimerCounter;
			int Status;
			Status = XTmrCtr_Initialize(TmrCtrInstancePtr, TMRCTR_DEVICE_ID);
			if (Status != XST_SUCCESS) {
				mb_printf("Failed to initialize the timer\r\n");
			}

			XTmrCtr_SetOptions(TmrCtrInstancePtr, TIMER_COUNTER_0, XTC_AUTO_RELOAD_OPTION);

			XTmrCtr_Start(TmrCtrInstancePtr, TIMER_COUNTER_0);
			Value1 = XTmrCtr_GetValue(TmrCtrInstancePtr, TIMER_COUNTER_0);

			/*timer counter- end*/

			/*put the execution function you want to measure*/
			//int return_value = benchmark_body(1);
			int return_value = benchmark();
			Value2 = XTmrCtr_GetValue(TmrCtrInstancePtr, TIMER_COUNTER_0);
			u32 res = Value2 - Value1;
			if (verify_benchmark(return_value) == 1)
				mb_printf("Results Verified success \r\n");
			else
				mb_printf("Returnred value %d \r\n", return_value);
			/*timer counter- start*/

			mb_printf("Enclave CPU cycles to complete execution for libedn =  %d\r\n",res );
			XTmrCtr_Reset(TmrCtrInstancePtr, TIMER_COUNTER_0);
			/*Finish cycle count*/
			usleep(1000);
			set_stopped();
		}
	}

	cleanup_platform();
	return 0;
}
