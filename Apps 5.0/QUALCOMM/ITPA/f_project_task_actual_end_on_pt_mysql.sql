SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.actual_end_on' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.pm_project_task_final SRC 

JOIN (select source_id , max(lastupdated) refresh_date from qualcomm_mdwdb.d_o_data_freshness group by 1) FR
ON FR.source_id = SRC.sourceinstance

LEFT JOIN qualcomm_mdwdb.d_lov_map LM
on (LM.dimension_class ='PROJECT' and LM.dimension_type='STATE'
and LM.dimension_code=SRC.state)

LEFT JOIN qualcomm_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
 WHERE COALESCE( 
 CASE WHEN LM.dimension_wh_code='IN PROGRESS' and (cast(TRGT.planned_start_on as date)=cast(FR.refresh_date as date) and cast(TRGT.planned_start_on as time)> '17:00:00') then convert_tz(SRC.work_end,'GMT','GMT')
 WHEN LM.dimension_wh_code='IN PROGRESS' and (TRGT.planned_start_on>FR.refresh_date or TRGT.actual_start_on>FR.refresh_date) then convert_tz(SRC.work_end,'GMT','GMT')
 WHEN LM.dimension_wh_code='IN PROGRESS' and (cast(TRGT.actual_start_on as date)=cast(FR.refresh_date as date) and cast(TRGT.actual_start_on as time)> '17:00:00') then convert_tz(SRC.work_end,'GMT','GMT')
 WHEN LM.dimension_wh_code='IN PROGRESS' then FR.refresh_date
 ELSE convert_tz(SRC.work_end,'GMT','GMT') END,'')
 <>COALESCE(TRGT.actual_end_on ,'');
