/******************************************************************************
*
* Freescale Semiconductor Inc.
* (c) Copyright 2004-2010 Freescale Semiconductor, Inc.
* ALL RIGHTS RESERVED.
*
******************************************************************************
*
* THIS SOFTWARE IS PROVIDED BY FREESCALE "AS IS" AND ANY EXPRESSED OR
* IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
* OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
* IN NO EVENT SHALL FREESCALE OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
* INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
* HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
* STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
* IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
* THE POSSIBILITY OF SUCH DAMAGE.
*
**************************************************************************//*!
*
* @file audio_pit1_kinetis.c
*
* @author
*
* @version
*
* @date
*
* @brief   This file configures PIT for Timer implementation
*
*****************************************************************************/

/******************************************************************************
* Includes
*****************************************************************************/
#include <string.h>
#include "derivative.h"     /* include peripheral declarations */
#include "types.h"          /* Contains User Defined Data Types */
#include "audio_pwm.h"
#include "usb_class.h"
#include "usb_descriptor.h"

extern uint_8 audio_sample;
extern uint_8 audio_event;
extern uint_8 audio_data_recv[8];
extern uint_8 g_cur_mute[USB_MAX_SUPPORTED_INTERFACES];

/******************************************************************************
* @name   pit1_init
*
* @brief   Init PIT1
*
* @param       None
*
* @return     None
*
*****************************************************************************
* This function init the PIT1
*****************************************************************************/
void pit1_init(void)
{

    SIM_SCGC6 |= SIM_SCGC6_PIT_MASK;
#if (defined MCU_MK21D5)
	NVICICPR1 = (1 << 17);   /* Clear any pending interrupts on PIT1 */
	NVICISER1 = (1 << 17);   /* Enable interrupts from PIT1 module */
#elif (defined MCU_MKL25Z4)
	NVIC_ICPR = (1 << 22);   /* Clear any pending interrupts on PIT1 */
	NVIC_ISER = (1 << 22);   /* Enable interrupts from PIT1 module */
#else
	NVICICPR2 = (1 << 5);   /* Clear any pending interrupts on PIT1 */
	NVICISER2 = (1 << 5);   /* Enable interrupts from PIT1 module */
#endif

    /* Configure PIT */
    PIT_MCR = ~(PIT_MCR_FRZ_MASK |PIT_MCR_MDIS_MASK);

    /* Timer 0.1ms */
    #if defined MCU_MKL25Z4
		PIT_LDVAL1 = 24000/8;
	#else
		PIT_LDVAL1 = 48000/8;
	#endif

    /* Mask PIT interrupt flag */
    PIT_TFLG1 = PIT_TFLG_TIF_MASK;

    /* Enable PIT interrupt */
    PIT_TCTRL1 |= PIT_TCTRL_TIE_MASK;
    PIT_TCTRL1 |= PIT_TCTRL_TEN_MASK;
}

/******************************************************************************
* @name  pit1_isr
*
* @brief  Interrupt service routine of PIT1
*
* @param     None
*
* @return   None
*
*****************************************************************************
* This function responses to Interrupt service routine of PIT1
*****************************************************************************/
void  pit1_isr(void)
{
    if (audio_event == USB_APP_DATA_RECEIVED){
#if (defined MCU_MK21D5)
            NVICICPR1 = (1 << 17);   /* Clear any pending interrupts on PIT1 */
            NVICISER1 = (1 << 17);   /* Enable interrupts from PIT1 module */
#elif (defined MCU_MKL25Z4)
            NVIC_ICPR = (1 << 22);   /* Clear any pending interrupts on PIT1 */
            NVIC_ISER = (1 << 22);   /* Enable interrupts from PIT1 module */
#else
            NVICICPR2 = (1 << 5);   /* Clear any pending interrupts on PIT1 */
            NVICISER2 = (1 << 5);   /* Enable interrupts from PIT1 module */
#endif
        /* update duty */
        #ifndef MCU_MKL25Z4
        FTM0_MODE &= ~FTM_MODE_FTMEN_MASK;
        #endif
        if(g_cur_mute[0] == 0)
        {
            duty = audio_data_recv[audio_sample];
        #ifndef MCU_MKL25Z4
            while(duty != audio_data_recv[audio_sample]);
        #endif
        }
        else
        {
            duty = 0;
            while(duty != 0);
        }
        #ifndef MCU_MKL25Z4
        FTM0_MODE |= FTM_MODE_FTMEN_MASK;
        #endif
        audio_sample+=1;
        if (7 < audio_sample){
            audio_sample = 0;
            audio_event = 0;
        }
    }
    PIT_TFLG1 |= PIT_TFLG_TIF_MASK;
    PIT_TCTRL1 |= PIT_TCTRL_TIE_MASK;
}

