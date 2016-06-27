

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.is_upcoming' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.pm_project_task_final SRC 
JOIN (select source_id , max(lastupdated) refresh_date from <<tenant>>_mdwdb.d_o_data_freshness group by 1) FR
ON FR.source_id = SRC.sourceinstance
LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance =L.sourceid )
LEFT JOIN  <<tenant>>_mdwdb.d_lov_map LM
ON ( LM.src_rowid =concat('PROJECT~STATE~~',SRC.state))
LEFT JOIN <<tenant>>_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( case when SRC.start_date > convert_tz(FR.refresh_date,target_time_zone,source_time_zone) AND LM.dimension_wh_code='OPEN' 
 then 'Y' else 'N' end ,'')
 <> COALESCE(TRGT.is_upcoming ,'')
