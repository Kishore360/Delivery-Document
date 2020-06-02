SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM  #MDS_TABLE_SCHEMA.hp_wp_tasks_final SRC WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN  #MDS_TABLE_SCHEMA.hp_wp_task_actuals_final SRC2
 on SRC.TASK_ACTUALS_ID = SRC2.ACTUALS_ID and SRC.sourceinstance = SRC2.sourceinstance
  LEFT JOIN  #MDS_TABLE_SCHEMA.hp_wp_task_schedule_final SRC3
 on SRC.TASK_SCHEDULE_ID = SRC3.TASK_SCHEDULE_ID and SRC.sourceinstance = SRC3.sourceinstance
   LEFT JOIN  #MDS_TABLE_SCHEMA.hp_wp_task_costs_final SRC4
  on SRC.TASK_COST_ID = SRC4.TASK_COST_ID and SRC.sourceinstance = SRC4.sourceinstance
  LEFT JOIN  #MDS_TABLE_SCHEMA.hp_wp_task_info_final SRC5
  on SRC.TASK_INFO_ID = SRC5.TASK_INFO_ID and SRC.sourceinstance = SRC5.sourceinstance
   LEFT JOIN  #DWH_TABLE_SCHEMA.f_project_task TRGT 
 ON (SRC.TASK_ID=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id ) 
 LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov  LKP
  on CONCAT('Project_Task~State~',SRC5.STATUS) = LKP.row_id
 left join  #DWH_TABLE_SCHEMA.d_lov_map MAP
on SRC.sourceinstance = MAP.source_id
and  COALESCE(LKP.row_key,CASE WHEN SRC5.STATUS IS NULL THEN 0 else '-1' end) = MAP.src_key
where CASE 
            WHEN MAP.dimension_wh_code IN ('IN PROGRESS') THEN   (SELECT
                max(lastupdated) 
            FROM
                 #DWH_TABLE_SCHEMA.d_o_data_freshness 
            WHERE
                source_id =SRC.sourceinstance
                ) 
            ELSE COALESCE(CONVERT_TZ(SRC2.ACT_FINISH_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'') END <> TRGT.actual_end_on_numerify