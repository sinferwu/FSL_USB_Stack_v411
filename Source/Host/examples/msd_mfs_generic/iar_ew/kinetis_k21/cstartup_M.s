/**************************************************
 *
 * Copyright 2012 IAR Systems. All rights reserved.
 *
 * $Revision: #2 $
 *
 **************************************************/

;
; The modules in this file are included in the libraries, and may be replaced
; by any user-defined modules that define the PUBLIC symbol _program_start or
; a user defined start symbol.
; To override the cstartup defined in the library, simply add your modified
; version to the workbench project.
;
; The vector table is normally located at address 0.
; When debugging in RAM, it can be located in RAM, aligned to at least 2^6.
; The name "__vector_table" has special meaning for C-SPY:
; it is where the SP start value is found, and the NVIC vector
; table register (VTOR) is initialized to this address if != 0.
;
; Cortex-M version
;

        MODULE  ?cstartup

        ;; Forward declaration of sections.
        SECTION CSTACK:DATA:NOROOT(3)

        SECTION .intvec:CODE:ROOT(2)

        EXTERN  __iar_program_start
        PUBLIC  ___VECTOR_RAM
        PUBLIC  __vector_table
        EXTERN  USB_ISR
        EXTERN  PIT1_ISR

        DATA
___VECTOR_RAM
__vector_table
        DCD     sfe(CSTACK)               ; Top of Stack
        DCD     __iar_program_start       ; Reset Handler
        DCD     NMI_Handler               ; NMI Handler
        DCD     HardFault_Handler         ; Hard Fault Handler
        DCD     MemManage_Handler         ; MPU Fault Handler
        DCD     BusFault_Handler          ; Bus Fault Handler
        DCD     UsageFault_Handler        ; Usage Fault Handler
        DCD     0                         ; Reserved
        DCD     0                         ; Reserved
        DCD     0                         ; Reserved
        DCD     0                         ; Reserved
        DCD     SVC_Handler               ; SVCall Handler
        DCD     DebugMon_Handler          ; Debug Monitor Handler
        DCD     0                         ; Reserved
        DCD     PendSV_Handler            ; PendSV Handler
        DCD     SysTick_Handler           ; SysTick Handler
        ; External Interrupts
        DCD     DMA0_IRQHandler           ; 0:  DMA Channel 0 transfer complete
        DCD     DMA1_IRQHandler           ; 1:  DMA Channel 1 transfer complete
        DCD     DMA2_IRQHandler           ; 2:  DMA Channel 2 transfer complete
        DCD     DMA3_IRQHandler           ; 3:  DMA Channel 3 transfer complete
        DCD     DMA4_IRQHandler           ; 4:  DMA Channel 4 transfer complete
        DCD     DMA5_IRQHandler           ; 5:  DMA Channel 5 transfer complete
        DCD     DMA6_IRQHandler           ; 6:  DMA Channel 6 transfer complete
        DCD     DMA7_IRQHandler           ; 7:  DMA Channel 7 transfer complete
        DCD     DMA8_IRQHandler           ; 8:  DMA Channel 8 transfer complete
        DCD     DMA9_IRQHandler           ; 9:  DMA Channel 9 transfer complete
        DCD     DMA10_IRQHandler          ;10:  DMA Channel 10 transfer complete
        DCD     DMA11_IRQHandler          ;11:  DMA Channel 11 transfer complete
        DCD     DMA12_IRQHandler          ;12:  DMA Channel 12 transfer complete
        DCD     DMA13_IRQHandler          ;13:  DMA Channel 13 transfer complete
        DCD     DMA14_IRQHandler          ;14:  DMA Channel 14 transfer complete
        DCD     DMA15_IRQHandler          ;15:  DMA Channel 15 transfer complete
        DCD     DMA_ERR_IRQHandler        ;16:  DMA Error Interrupt Channels 0-15
        DCD     MCM_IRQHandler            ;17:  MCM Normal interrupt
        DCD     FLASH_CC_IRQHandler       ;18:  Flash memory command complete
        DCD     FLASH_RC_IRQHandler       ;19:  Flash memory read collision
        DCD     VLD_IRQHandler            ;20:  Low Voltage Detect, Low Voltage Warning
        DCD     LLWU_IRQHandler           ;21:  Low Leakage Wakeup
        DCD     WDOG_IRQHandler           ;22:  WDOG interrupt
        DCD     RNG_IRQHandler            ;23:  RNG generator
        DCD     I2C0_IRQHandler           ;24:  I2C0 interrupt
        DCD     I2C1_IRQHandler           ;25:  I2C1 interrupt
        DCD     SPI0_IRQHandler           ;26:  SPI 0 interrupt
        DCD     SPI1_IRQHandler           ;27:  SPI 1 interrupt
        DCD     I2S0_Tx_IRQHandler        ;28:  I2S Tx
        DCD     I2S0_Rx_IRQHandler				;29:  I2S Rx
        DCD     UART0_LON_IRQHandler  		;30:  UART 0 LON interrupt
        DCD     UART0_RX_TX_IRQHandler		;31:  UART 0 Receive/Transmit interrupt
        DCD     UART0_ERR_IRQHandler			;32:  UART 0 error intertrupt
        DCD     UART1_RX_TX_IRQHandler		;33:  UART 1 Receive/Transmit interrupt
        DCD     UART1_ERR_IRQHandler			;34:  UART 1 error intertrupt
        DCD     UART2_RX_TX_IRQHandler   	;35:  UART 2 Receive/Transmit interrupt
        DCD     UART2_ERR_IRQHandler      ;36:  UART 2 error intertrupt
        DCD     UART3_RX_TX_IRQHandler		;37:  UART 3 Receive/Transmit interrupt
        DCD     UART3_ERR_IRQHandler  		;38:  UART 3 error intertrupt
        DCD     ADC0_IRQHandler 					;39:  ADC 0 interrupt
        DCD     CMP0_IRQHandler						;40:  CMP 0 High-speed comparator interrupt
        DCD     CMP1_IRQHandler						;41:  CMP 1 High-speed comparator interrupt
        DCD     FTM0_IRQHandler           ;42:  FTM 0 interrupt
        DCD     FTM1_IRQHandler           ;43:  FTM 1 interrupt
        DCD     FTM2_IRQHandler           ;44:  FTM 2 interrupt
        DCD     CMT_IRQHandler            ;45:  CMT intrrupt
        DCD     RTC_IRQHandler            ;46:  RTC intrrupt
        DCD     RTC_SE_IRQHandler         ;47:  RTC second interrupt
        DCD     PIT0_IRQHandler                  ;48:  PIT 0 interrupt
        DCD     PIT1_ISR                  ;49:  PIT 1 interrupt
        DCD     PIT2_IRQHandler           ;50:  PIT 2 interrupt
        DCD     PIT3_IRQHandler           ;51:  PIT 3 interrupt
        DCD     PDB0_IRQHandler           ;52:  PDB 0 interrupt
        DCD     USB_ISR           ;53:  USB 0 interrupt
        DCD     USBDCD_IRQHandler         ;54:  USB Charger Detect interrupt
        DCD     DRYICE_IRQHandler         ;55:  DryIce interrupt
        DCD     DAC0_IRQHandler         	;56:  DAC 0 interrupt
        DCD     MCG_IRQHandler         		;57:  MCG interrupt
        DCD     LPT_IRQHandler            ;58:  LPT interrupt
        DCD     PORTA_IRQHandler          ;59:  PORT A interrupt
        DCD     PORTB_IRQHandler          ;60:  PORT B interrupt
        DCD     PORTC_IRQHandler             ;61:  PORT C interrupt
        DCD     PORTD_IRQHandler          ;62:  PORT D interrupt
        DCD     PORTE_IRQHandler          ;63:  PORT E interrupt
        DCD     SW_IRQHandler          		;64:  Software interrupt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Default interrupt handlers.
;;

      PUBWEAK NMI_Handler
      PUBWEAK HardFault_Handler
      PUBWEAK MemManage_Handler
      PUBWEAK BusFault_Handler
      PUBWEAK UsageFault_Handler
      PUBWEAK SVC_Handler
      PUBWEAK DebugMon_Handler
      PUBWEAK PendSV_Handler
      PUBWEAK SysTick_Handler
      PUBWEAK DMA0_IRQHandler
      PUBWEAK DMA1_IRQHandler
      PUBWEAK DMA2_IRQHandler
      PUBWEAK DMA3_IRQHandler
      PUBWEAK DMA4_IRQHandler
      PUBWEAK DMA5_IRQHandler
      PUBWEAK DMA6_IRQHandler
      PUBWEAK DMA7_IRQHandler
      PUBWEAK DMA8_IRQHandler
      PUBWEAK DMA9_IRQHandler
      PUBWEAK DMA10_IRQHandler
      PUBWEAK DMA11_IRQHandler
      PUBWEAK DMA12_IRQHandler
      PUBWEAK DMA13_IRQHandler
      PUBWEAK DMA14_IRQHandler
      PUBWEAK DMA15_IRQHandler
      PUBWEAK DMA_ERR_IRQHandler
      PUBWEAK MCM_IRQHandler
      PUBWEAK FLASH_CC_IRQHandler
      PUBWEAK FLASH_RC_IRQHandler
      PUBWEAK VLD_IRQHandler
      PUBWEAK LLWU_IRQHandler
      PUBWEAK WDOG_IRQHandler
      PUBWEAK RNG_IRQHandler
      PUBWEAK I2C0_IRQHandler
      PUBWEAK I2C1_IRQHandler
      PUBWEAK SPI0_IRQHandler
      PUBWEAK SPI1_IRQHandler
      PUBWEAK I2S0_Tx_IRQHandler
      PUBWEAK I2S0_Rx_IRQHandler
      PUBWEAK UART0_LON_IRQHandler
      PUBWEAK UART0_RX_TX_IRQHandler
      PUBWEAK UART0_ERR_IRQHandler
      PUBWEAK UART1_RX_TX_IRQHandler
      PUBWEAK UART1_ERR_IRQHandler
      PUBWEAK UART2_RX_TX_IRQHandler
      PUBWEAK UART2_ERR_IRQHandler
      PUBWEAK UART3_RX_TX_IRQHandler
      PUBWEAK UART3_ERR_IRQHandler
      PUBWEAK ADC0_IRQHandler
      PUBWEAK CMP0_IRQHandler
      PUBWEAK CMP1_IRQHandler
      PUBWEAK FTM0_IRQHandler
      PUBWEAK FTM1_IRQHandler
      PUBWEAK FTM2_IRQHandler
      PUBWEAK CMT_IRQHandler
      PUBWEAK RTC_IRQHandler
      PUBWEAK RTC_SE_IRQHandler
      PUBWEAK PIT0_IRQHandler
      PUBWEAK PIT1_IRQHandler
      PUBWEAK PIT2_IRQHandler
      PUBWEAK PIT3_IRQHandler
      PUBWEAK PDB0_IRQHandler
      PUBWEAK USB0_IRQHandler
      PUBWEAK USBDCD_IRQHandler
      PUBWEAK DRYICE_IRQHandler
      PUBWEAK DAC0_IRQHandler
      PUBWEAK MCG_IRQHandler
      PUBWEAK LPT_IRQHandler
      PUBWEAK PORTA_IRQHandler
      PUBWEAK PORTB_IRQHandler
      PUBWEAK PORTC_IRQHandler
      PUBWEAK PORTD_IRQHandler
      PUBWEAK PORTE_IRQHandler
      PUBWEAK SW_IRQHandler

      SECTION .text:CODE:REORDER(1)
      THUMB
NMI_Handler
HardFault_Handler
MemManage_Handler
BusFault_Handler
UsageFault_Handler
SVC_Handler
DebugMon_Handler
PendSV_Handler
SysTick_Handler
DMA0_IRQHandler
DMA1_IRQHandler
DMA2_IRQHandler
DMA3_IRQHandler
DMA4_IRQHandler
DMA5_IRQHandler
DMA6_IRQHandler
DMA7_IRQHandler
DMA8_IRQHandler
DMA9_IRQHandler
DMA10_IRQHandler
DMA11_IRQHandler
DMA12_IRQHandler
DMA13_IRQHandler
DMA14_IRQHandler
DMA15_IRQHandler
DMA_ERR_IRQHandler
MCM_IRQHandler
FLASH_CC_IRQHandler
FLASH_RC_IRQHandler
VLD_IRQHandler
LLWU_IRQHandler
WDOG_IRQHandler
RNG_IRQHandler
I2C0_IRQHandler
I2C1_IRQHandler
SPI0_IRQHandler
SPI1_IRQHandler
I2S0_Tx_IRQHandler
I2S0_Rx_IRQHandler
UART0_LON_IRQHandler
UART0_RX_TX_IRQHandler
UART0_ERR_IRQHandler
UART1_RX_TX_IRQHandler
UART1_ERR_IRQHandler
UART2_RX_TX_IRQHandler
UART2_ERR_IRQHandler
UART3_RX_TX_IRQHandler
UART3_ERR_IRQHandler
ADC0_IRQHandler
CMP0_IRQHandler
CMP1_IRQHandler
FTM0_IRQHandler
FTM1_IRQHandler
FTM2_IRQHandler
CMT_IRQHandler
RTC_IRQHandler
RTC_SE_IRQHandler
PIT0_IRQHandler
PIT1_IRQHandler
PIT2_IRQHandler
PIT3_IRQHandler
PDB0_IRQHandler
USB0_IRQHandler
USBDCD_IRQHandler
DRYICE_IRQHandler
DAC0_IRQHandler
MCG_IRQHandler
LPT_IRQHandler
PORTA_IRQHandler
PORTB_IRQHandler
PORTC_IRQHandler
PORTD_IRQHandler
PORTE_IRQHandler
SW_IRQHandler
Default_Handler

        B Default_Handler
        END
