/*************************************************************************
  *                                                                      *
  *  Copyright Notice:  (c) 1983 Laboratory Information Systems &        *
  *                              Technology, Inc.                        *
  *       Revision      (c) 1984-1997 Cerner Corporation                 *
  *                                                                      *
  *  Cerner (R) Proprietary Rights Notice:  All rights reserved.         *
  *  This material contains the valuable properties and trade secrets of *
  *  Cerner Corporation of Kansas City, Missouri, United States of       *
  *  America (Cerner), embodying substantial creative efforts and        *
  *  confidential information, ideas and expressions, no part of which   *
  *  may be reproduced or transmitted in any form or by any means, or    *
  *  retained in any storage or retrieval system without the express     *
  *  written permission of Cerner.                                       *
  *                                                                      *
  *  Cerner is a registered mark of Cerner Corporation.                  *
  *                                                                      *
  ************************************************************************/
/*************************************************************************

        Source file name:		mp_retrieve_mock_data.prg
        Object name:			mp_retrieve_mock_data

        Product:                Discern MPages
        Product Team:           Discern ABU

        Program purpose:        This script is just for learning/demo purpose only.
        						New component developers without any data retrieval scipt can use fake data returned from this script to
        						load there component in an actual MPage view.

        Tables read:          	None

        Tables updated:         None

        Executing from:         PowerChart

        Special Notes:          Note
**************************************************************************/
drop program mp_retrieve_mock_data go
create program mp_retrieve_mock_data

prompt
	"Output to File/Printer/MINE" = "MINE"   ;* Enter or select the printer or file name to send this report to.
	, "DESIRED_STATUS" = "S"                 ;* Defaults to S, Z implies to No Data and F implies ot Failure

with OUTDEV, DESIRED_STATUS

%i cclsource:mp_common.inc
%i cclsource:mp_script_logging.inc

set log_program_name = "mp_retrieve_mock_data"
/**************************************************************
; DVDev DECLARED SUBROUTINES
**************************************************************/
declare prepareData (null) = null with protect

/**************************************************************
; DVDev DECLARED VARIABLES
**************************************************************/
declare PROG_START_TIME = dq8 with protect, constant(CURTIME3)

free record physical_activities
record physical_activities(
	1 activity_count 		= i4
	1 activity[*]
		2 activity_id		= f8
		2 activity_name     = vc
		2 days_per_week	= i4
		2 activity_level	= vc
		2 duration       	= vc
		2 weekly_data[*]
			3 calories_burnt 	= vc
	1 activity_levels[*]
		2 level_name        = vc
		2 level_id 			= f8
	1 activity_level_count  = i4
%i cclsource:status_block.inc
)
/**************************************************************
; DVDev Start Coding
**************************************************************/
;    Your Code Goes Here
;Setting the status to a default value of "S"

set physical_activities->status_data->status = $DESIRED_STATUS
if($DESIRED_STATUS = "F" or $DESIRED_STATUS = "Z")
	go to exit_script
endif

call prepareData(null)
/**************************************************************
; DVDev DEFINED SUBROUTINES
**************************************************************/
subroutine prepareData(null)
	set physical_activities->activity_count = 7
	set stat = alterlist(physical_activities->activity, 7)

	set stat = alterlist(physical_activities->activity[1]->weekly_data, 7)
	set physical_activities->activity[1]->activity_name = "Non Stop Walking"
	set physical_activities->activity[1]->activity_id = 1.0
	set physical_activities->activity[1]->duration = "30 minutes"
	set physical_activities->activity[1]->days_per_week = 4
	set physical_activities->activity[1]->activity_level = "Low Activity Level"

	set physical_activities->activity[1]->weekly_data[1]->calories_burnt = "70"
	set physical_activities->activity[1]->weekly_data[2]->calories_burnt = "0"
	set physical_activities->activity[1]->weekly_data[3]->calories_burnt = "70"
	set physical_activities->activity[1]->weekly_data[4]->calories_burnt = "0"
	set physical_activities->activity[1]->weekly_data[5]->calories_burnt = "70"
	set physical_activities->activity[1]->weekly_data[6]->calories_burnt = "0"
	set physical_activities->activity[1]->weekly_data[7]->calories_burnt = "0"

	set stat = alterlist(physical_activities->activity[2]->weekly_data, 7)
	set physical_activities->activity[2]->activity_name = "Playing Ping Pong"
	set physical_activities->activity[2]->activity_id = 2.0
	set physical_activities->activity[2]->duration = "30 minutes"
	set physical_activities->activity[2]->days_per_week = 2
	set physical_activities->activity[2]->activity_level = "Low Activity Level"

	set physical_activities->activity[2]->weekly_data[1]->calories_burnt = "147"
	set physical_activities->activity[2]->weekly_data[2]->calories_burnt = "0"
	set physical_activities->activity[2]->weekly_data[3]->calories_burnt = "147"
	set physical_activities->activity[2]->weekly_data[4]->calories_burnt = "0"
	set physical_activities->activity[2]->weekly_data[5]->calories_burnt = "0"
	set physical_activities->activity[2]->weekly_data[6]->calories_burnt = "0"
	set physical_activities->activity[2]->weekly_data[7]->calories_burnt = "0"

	set stat = alterlist(physical_activities->activity[3]->weekly_data, 7)
	set physical_activities->activity[3]->activity_name = "Raking"
	set physical_activities->activity[3]->activity_id = 3.0
	set physical_activities->activity[3]->duration = "120 minutes"
	set physical_activities->activity[3]->days_per_week = 1
	set physical_activities->activity[3]->activity_level = "Low Activity Level"

	set physical_activities->activity[3]->weekly_data[1]->calories_burnt = "0"
	set physical_activities->activity[3]->weekly_data[2]->calories_burnt = "0"
	set physical_activities->activity[3]->weekly_data[3]->calories_burnt = "0"
	set physical_activities->activity[3]->weekly_data[4]->calories_burnt = "0"
	set physical_activities->activity[3]->weekly_data[5]->calories_burnt = "0"
	set physical_activities->activity[3]->weekly_data[6]->calories_burnt = "0"
	set physical_activities->activity[3]->weekly_data[7]->calories_burnt = "350"

	set stat = alterlist(physical_activities->activity[4]->weekly_data, 7)
	set physical_activities->activity[4]->activity_name = "Jogging"
	set physical_activities->activity[4]->activity_id = 4.0
	set physical_activities->activity[4]->duration = "30 minutes"
	set physical_activities->activity[4]->days_per_week = 3
	set physical_activities->activity[4]->activity_level = "Moderate Activity Level"

	set physical_activities->activity[4]->weekly_data[1]->calories_burnt = "0"
	set physical_activities->activity[4]->weekly_data[2]->calories_burnt = "190"
	set physical_activities->activity[4]->weekly_data[3]->calories_burnt = "0"
	set physical_activities->activity[4]->weekly_data[4]->calories_burnt = "190"
	set physical_activities->activity[4]->weekly_data[5]->calories_burnt = "0"
	set physical_activities->activity[4]->weekly_data[6]->calories_burnt = "190"
	set physical_activities->activity[4]->weekly_data[7]->calories_burnt = "0"

	set stat = alterlist(physical_activities->activity[5]->weekly_data, 7)
	set physical_activities->activity[5]->activity_name = "Stretching"
	set physical_activities->activity[5]->activity_id = 5.0
	set physical_activities->activity[5]->duration = "30 minutes"
	set physical_activities->activity[5]->days_per_week = 2
	set physical_activities->activity[5]->activity_level = "Moderate Activity Level"

	set physical_activities->activity[5]->weekly_data[1]->calories_burnt = "0"
	set physical_activities->activity[5]->weekly_data[2]->calories_burnt = "150"
	set physical_activities->activity[5]->weekly_data[3]->calories_burnt = "0"
	set physical_activities->activity[5]->weekly_data[4]->calories_burnt = "150"
	set physical_activities->activity[5]->weekly_data[5]->calories_burnt = "0"
	set physical_activities->activity[5]->weekly_data[6]->calories_burnt = "0"
	set physical_activities->activity[5]->weekly_data[7]->calories_burnt = "0"

	set stat = alterlist(physical_activities->activity[6]->weekly_data, 7)
	set physical_activities->activity[6]->activity_name = "Compound Exercises"
	set physical_activities->activity[6]->activity_id = 6.0
	set physical_activities->activity[6]->duration = "30 minutes"
	set physical_activities->activity[6]->days_per_week = 2
	set physical_activities->activity[6]->activity_level = "Vigorous Activity Level"

	set physical_activities->activity[6]->weekly_data[1]->calories_burnt = "0"
	set physical_activities->activity[6]->weekly_data[2]->calories_burnt = "0"
	set physical_activities->activity[6]->weekly_data[3]->calories_burnt = "250"
	set physical_activities->activity[6]->weekly_data[4]->calories_burnt = "0"
	set physical_activities->activity[6]->weekly_data[5]->calories_burnt = "250"
	set physical_activities->activity[6]->weekly_data[6]->calories_burnt = "0"
	set physical_activities->activity[6]->weekly_data[7]->calories_burnt = "0"

	set stat = alterlist(physical_activities->activity[7]->weekly_data, 7)
	set physical_activities->activity[7]->activity_name = "Circuit Training"
	set physical_activities->activity[7]->activity_id = 7.0
	set physical_activities->activity[7]->duration = "40 minutes"
	set physical_activities->activity[7]->days_per_week = 1
	set physical_activities->activity[7]->activity_level = "Vigorous Activity Level"

	set physical_activities->activity[7]->weekly_data[1]->calories_burnt = "0"
	set physical_activities->activity[7]->weekly_data[2]->calories_burnt = "0"
	set physical_activities->activity[7]->weekly_data[3]->calories_burnt = "0"
	set physical_activities->activity[7]->weekly_data[4]->calories_burnt = "0"
	set physical_activities->activity[7]->weekly_data[5]->calories_burnt = "0"
	set physical_activities->activity[7]->weekly_data[6]->calories_burnt = "300"
	set physical_activities->activity[7]->weekly_data[7]->calories_burnt = "0"

	set physical_activities->activity_level_count = 3
	set stat = alterlist(physical_activities->activity_levels, 3)

	set physical_activities->activity_levels[1]->level_name = "Low Activity Level"
	set physical_activities->activity_levels[1]->level_id = 987654.0
	set physical_activities->activity_levels[2]->level_name = "Moderate Activity Level"
	set physical_activities->activity_levels[2]->level_id = 876543.0
	set physical_activities->activity_levels[3]->level_name = "Vigorous Activity Level"
	set physical_activities->activity_levels[3]->level_id = 765432.0
end

#exit_script

call PutJSONRecordToFile(physical_activities)

if(validate(debug_ind) = 1)
	call echorecord(physical_activities)
else
	free record physical_activities
endif

call log_message(concat("Exiting script: ", log_program_name), LOG_LEVEL_DEBUG)
call log_message(build("Total time in hundseconds:",((CURTIME3 - PROG_START_TIME)/100)), LOG_LEVEL_DEBUG)
end
go
