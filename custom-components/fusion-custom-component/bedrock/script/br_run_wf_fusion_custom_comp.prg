/*~BB~************************************************************************
      *                                                                      *
      *  Copyright Notice:  (c) 1983 Laboratory Information Systems &        *
      *                              Technology, Inc.                        *
      *       Revision      (c) 1984-2002 Cerner Corporation                 *
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
  ~BE~***********************************************************************/

/*****************************************************************************
        Source file name:        br_run_wf_fusion_custom_comp.prg
        Object name:             br_run_wf_fusion_custom_comp
        Request #:

        Product:                 MPages
        Product Team:            MPages

        Program purpose:         Imports Fusion Custom Component Bedrock
                                 settings into related Bedrock tables

        Tables read:             None

        Tables updated:          br_datamart_report_default
                                 br_datamart_category
                                 br_datamart_report
                                 br_datamart_filter
                                 br_datamart_text
                                 br_datamart_report_filter_r


        Executing from:          DiscernVisualDeveloper

        Special Notes:

******************************************************************************/

drop program br_run_wf_fusion_custom_comp:dba go
create program br_run_wf_fusion_custom_comp:dba

%i cclsource:dm_readme_data.inc
set readme_data->status = "F"
set readme_data->message =
               "Readme Failed: Starting <br_run_wf_fusion_custom_comp> script"

execute dm_dbimport "cer_install:datamart_cat_mp_vb_wf_fusion_custom_comp.csv",
                    "br_datamart_category_config", 5000

execute dm_dbimport "cer_install:datamart_report_mp_vb_wf_fusion_custom_comp.csv",
                    "br_datamart_report_config", 5000

execute dm_dbimport "cer_install:datamart_filter_mp_vb_wf_fusion_custom_comp.csv",
                    "br_datamart_filter_config", 5000

execute dm_dbimport "cer_install:datamart_filter_cat_mp_vb_wf_fusion_custom_comp.csv",
                    "br_datamart_filter_cat_config", 5000

execute dm_dbimport "cer_install:datamart_report_filter_mp_vb_wf_fusion_custom_comp.csv",
                    "br_datamart_rpt_filter_config", 5000

;execute dm_dbimport "cer_install:datamart_default_mp_vb_wf_fusion_custom_comp.csv",
;                    "br_datamart_default_config", 7000

execute dm_dbimport "cer_install:datamart_text_mp_vb_wf_fusion_custom_comp.csv",
                    "br_datamart_text_config", 5000

execute dm_dbimport "cer_install:datamart_rpt_default_mp_vb_wf_fusion_custom_comp.csv",
                    "br_datamart_rpt_default_config", 5000

execute dm_dbimport "cer_install:datamart_rpt_layout_mp_vb_wf_fusion_custom_comp.csv",
                    "br_datamart_rpt_layout_config", 5000
#EXIT_SCRIPT

execute dm_readme_status:dba
call echorecord(readme_data)

end
go
