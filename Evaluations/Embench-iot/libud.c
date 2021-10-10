
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

