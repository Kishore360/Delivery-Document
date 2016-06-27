

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.portfolio_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.pm_project_task_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE 0<> COALESCE(TRGT.portfolio_key,'')
