SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_efford.row_id' ELSE 'SUCCESS' END as Message
FROM 
(select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC
left join(select CONCAT(COALESCE(time_sheet.WORK_ITEM_SET_ID,'UNSPECIFIED'),'~',COALESCE(DATE_FORMAT(CONVERT_TZ(DATE_ADD(ktmg_period.START_DATE, INTERVAL COALESCE(act_effort.effort_order,0) DAY),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'),'UNSPECIFIED')) as actual_row_id,
COALESCE(DATE_FORMAT(CONVERT_TZ(DATE_ADD(ktmg_period.START_DATE,INTERVAL COALESCE(act_effort.effort_order,0)DAY),
'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'),'UNSPECIFIED') AS Calendar_Date_key,time_sheet.WORK_ITEM_SET_ID as project_key, time_sheet.WORK_ITEM_SET_ID as work_item_set_id,sum(act_effort.total_effort) total_effort,state
from
(select * from  #MDS_TABLE_SCHEMA.hp_tm_time_sheet_lines_final)time_sheet
left join (select * from  #MDS_TABLE_SCHEMA.hp_tm_time_sheets_final)time_sheet_final
on time_sheet.time_sheet_id=time_sheet_final.time_sheet_id
left join(select * from  #MDS_TABLE_SCHEMA.hp_ktmg_periods_final)ktmg_period
on time_sheet_final.period_id=ktmg_period.period_id
left join(SELECT CONCAT(tm_actuals.TIME_SHEET_LINE_ID,'~',COALESCE(tm_actuals_effort.EFFORT_ORDER,'UNSPECIFIED')) AS row_id,
tm_actuals.TIME_SHEET_LINE_ID AS timesheet_line_id,SUM(tm_actuals_effort.ACTUAL_EFFORT) AS total_effort,
tm_actuals.sourceinstance AS source_id,SUM(tm_actuals_effort.EFFORT_COST_BSE) AS total_effort_cost_bse,
tm_actuals_effort.EFFORT_ORDER AS effort_order FROM #MDS_TABLE_SCHEMA.hp_tm_actuals_final tm_actuals  
LEFT OUTER JOIN #MDS_TABLE_SCHEMA.hp_tm_actuals_effort_final tm_actuals_effort 
ON tm_actuals.ACTUALS_ID=tm_actuals_effort.ACTUALS_ID 
AND tm_actuals.sourceinstance=tm_actuals_effort.sourceinstance    
WHERE tm_actuals.TOTALS_FLAG='Y'  GROUP BY 1,2,4,6 ) act_effort
on time_sheet.time_sheet_line_id=act_effort.timesheet_line_id group by actual_row_id,calendar_date_key,project_key)time_sheet
on SRC.PRJ_PROJECT_ID=time_sheet.work_item_set_id
inner join(select sourceinstance as source_id,work_item_set_id as row_id,Max(1) as proj_count from 
#MDS_TABLE_SCHEMA.hp_tm_time_sheet_lines_final group by 1,2)proj_count
on SRC.PRJ_PROJECT_ID=proj_count.row_id
and SRC.sourceinstance=proj_count.source_id
left join(select * from  #DWH_TABLE_SCHEMA.f_project_effort)TRGT
on CONCAT('ACTUAL~',SRC.PRJ_PROJECT_ID,'~',COALESCE(time_sheet.actual_row_id,'UNSPECIFIED'))=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join(select * from #DWH_TABLE_SCHEMA.d_lov_map)LKP
on  LKP.row_id=concat('STATE~TIME_CARD~',time_sheet.STATE)
AND LKP.source_id=SRC.sourceinstance
WHERE  COALESCE(LKP.dimension_wh_code IN ('APPROVED','COMPLETED'),'UNKNOWN')
and time_sheet.actual_row_id is not null
and TRGT.row_id not in (CONCAT('PLANNED','~',SRC.PRJ_PROJECT_ID,'~',time_sheet.actual_row_id))
and  COALESCE(time_sheet.total_effort,'')<>round(COALESCE(TRGT.actual_effort,''),4)
and  COALESCE(TRGT.location_key,0)<>0
