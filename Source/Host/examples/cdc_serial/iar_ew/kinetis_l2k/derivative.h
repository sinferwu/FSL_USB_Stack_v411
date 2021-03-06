/*
 * Note: This file is recreated by the project wizard whenever the MCU is
 *       changed and should not be edited by hand
 */

/* Include the derivative-specific header file */

/*
 * Include the platform specific header file
 */
#if (defined(TWR_K40X256))
  #include <MK40N512VMD100.h>
#elif (defined(TWR_K53N512))
  #include <MK53N512CMD100.h>
#elif (defined(TWR_K60N512))
  #include <MK60N512VMD100.h>
#elif (defined(TWR_K20X128))
  #include <MK20D5.h>
#elif (defined(TWR_K21D50M))
  #include <MK21D5.h>
#elif (defined(TWR_MKL25Z128))
  #include <MKL25Z4.h>
#else
  #error "No valid platform defined"
#endif

#define _MK_xxx_H_
#define USE_POLL
#define printf printf_kinetis
#define sprintf sprintf_kinetis


