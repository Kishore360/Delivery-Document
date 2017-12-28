SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.is_in_effort_flag' ELSE 'SUCCESS' END as Message
  FROM qualcomm_mdsdb.pm_project_task_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  left join qualcomm_mdwdb.f_project_task FACT
 on FACT.project_key = TRGT.row_key
 WHERE case when (timestampdiff(hour,'1970-01-01 00:00:00',COALESCE(SRC.work_effort,'1970-01-01 00:00:00')) - 
 (timestampdiff(hour,'1970-01-01 00:00:00',COALESCE(SRC.effort,'1970-01-01 00:00:00')) * FACT.actual_percent_complete)) > 0 then 'N' else 'Y' end
 <> COALESCE(TRGT.is_in_effort_flag ,'')
