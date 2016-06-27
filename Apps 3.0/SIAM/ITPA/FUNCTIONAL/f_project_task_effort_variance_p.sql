

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.effort_variance' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.pm_project_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_lov_map DLM
 ON(DLM.src_rowid=CONCAT('PROJECT~STATE~~',SRC.state))
 LEFT JOIN <<tenant>>_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE CAST(CASE WHEN planned_effort = 0 AND actual_effort = 0 THEN 0
                   WHEN planned_effort = 0 AND actual_effort > 0 THEN 1
       ELSE ROUND( ( actual_effort - (planned_effort 1 planned_percent_complete) )/(planned_effort 1 planned_percent_complete),4)
  END as decimal(28,2) )<>CAST(TRGT.effort_variance as decimal(28,2) )
