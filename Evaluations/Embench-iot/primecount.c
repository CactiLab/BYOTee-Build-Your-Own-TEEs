
#define LOCAL_SCALE_FACTOR 1

#include <stdio.h>
#include <time.h>
#include <stdint.h>

/* We reduced the quantity of prime numbers to find in order to have an
 * execution time as close as possible to 4000 ms for the baseline */
#define SZ 42
/* Number of prime numbers we expect to find */
#define NPRIMES 3512

int32_t countPrimes(){
  int32_t primes[SZ], sieve[SZ];
  int nSieve = 0;
  primes[0] = 2; sieve[0] = 4; ++nSieve;
  int32_t nPrimes = 1, trial = 3, sqr=2;
  while (1){
    while (sqr*sqr <= trial) ++sqr;
    --sqr;
    for (int i=0; i<nSieve; ++i){
      if (primes[i] > sqr) goto found_prime;
      while (sieve[i] < trial) sieve[i] += primes[i];
      if (sieve[i] == trial) goto try_next;
    }
    break;
  found_prime:
    if (nSieve < SZ){
      primes[nSieve] = trial;
      sieve[nSieve] = trial*trial;
      ++nSieve;
    }
    ++nPrimes;
  try_next:
    trial+=1;
  }
  return nPrimes;
}

static int benchmark_body (int  rpt);

void
warm_caches (int heat)
{
  int  res = benchmark_body (heat);

  return;
}
#define CPU_MHZ 100
int
benchmark (void)
{
  return benchmark_body (LOCAL_SCALE_FACTOR * CPU_MHZ);
}

static int __attribute__ ((noinline))
benchmark_body (int rpt)
{
  int i, r = 0;

  for (i = 0; i < rpt; ++i)
    {
      r = countPrimes();
    }

  return r;
}

int verify_benchmark (int result);

void
initialise_benchmark (void)
{
}

int
verify_benchmark (int r)
{
  return NPRIMES == r;
}

