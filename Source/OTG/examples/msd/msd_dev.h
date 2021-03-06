/******************************************************************************
 *
 * Freescale Semiconductor Inc.
 * (c) Copyright 2004-2009 Freescale Semiconductor, Inc.
 * ALL RIGHTS RESERVED.
 *
 **************************************************************************//*!
 *
 * @file disk.h
 *
 * @author 
 *
 * @version 
 *
 * @date May-08-2009
 *
 * @brief The file contains Macro's and functions needed by the disk 
 *        application
 *
 *****************************************************************************/


#ifndef _DISK_H
#define _DISK_H  1

#include "user_config.h"
#include "derivative.h"

#if RAM_DISK_APP
  #include "usb_msc.h"
#elif SD_CARD_APP
 #ifdef __MCF52xxx_H__
  #include "SD_cfv2.h"
	 #else 
	#if(defined _MK_xxx_H_)
		#if USE_SPI_PROTOCOL
		#include "SD_kinetis.h"
 #else 
		#include "SD_esdhc_kinetis.h"
		#endif
	#elif defined(MCU_mcf51jf128)
		#include "SD_cfv1_plus.h"
	#else
		#include "SD.h"
	#endif
 #endif 
#endif  

/******************************************************************************
 * Constants - None
 *****************************************************************************/

/******************************************************************************
 * Macro's
 *****************************************************************************/
#define USB_CONTROLLER_ID       (0)

#if RAM_DISK_APP
    #define LENGTH_OF_EACH_LBA              (512)
	
	/* Length of each logical address block */
	#if defined MCU_MK20D5
    	#define TOTAL_LOGICAL_ADDRESS_BLOCKS    (1)
	#else
		#define TOTAL_LOGICAL_ADDRESS_BLOCKS    (4)
	#endif
    /* Total number of logical blocks present */
    #define DISK_SIZE                       (LENGTH_OF_EACH_LBA * TOTAL_LOGICAL_ADDRESS_BLOCKS)
#endif

#define LOGICAL_UNIT_SUPPORTED          	(1)

/*****************************************************************************
 * Global variables
 *****************************************************************************/
 
/******************************************************************************
 * Types
 *****************************************************************************/
#pragma pack(1)

typedef struct _disk_variable_struct
{
	uint_8 app_controller_ID;
	boolean start_app;
#if RAM_DISK_APP
	/* disk space reserved */
	uint_8 storage_disk[DISK_SIZE]; 
#endif	
	uint_8 disk_lock;
    #if (defined __CC_ARM)
    char reserved;
    #endif
}DISK_GLOBAL_VARIABLE_STRUCT, *PTR_DISK_GLOBAL_VARIABLE_STRUCT; 

/*****************************************************************************
 * Global Functions
 *****************************************************************************/
extern uint_32 App_PeripheralInit(void);
extern void App_PeripheralTask(void);
extern void App_PeripheralUninit(void);
extern void Disk_App(void);

#endif


/* EOF */
