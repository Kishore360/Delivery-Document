

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.risk_color_code' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.pm_project_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.risk ,'')<> COALESCE(TRGT.risk_color_code ,'')
