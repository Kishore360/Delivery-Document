SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.is_in_effort' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.pm_project_task_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE case when (timestampdiff(hour,'1970-01-01 00:00:00',COALESCE(SRC.work_effort,'1970-01-01 00:00:00')) - 
 (timestampdiff(hour,'1970-01-01 00:00:00',COALESCE(SRC.effort,'1970-01-01 00:00:00')) 1 TRGT.planned_percent_complete)) > 0 then 'N' else 'Y' end
 <> COALESCE(TRGT.is_in_effort ,'')
