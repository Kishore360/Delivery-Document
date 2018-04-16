SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.application_key' ELSE 'SUCCESS' END as Message 
  FROM <<tenant>>_mdsdb.change_task_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_change_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id ) 
 left join <<tenant>>_mdwdb.d_application ci
 on ci.row_id = CONCAT('APPLICATION~',SRC.cmdb_ci)
 and SRC.sourceinstance=ci.source_id
 WHERE coalesce (ci.row_key, case when SRC.cmdb_ci is null then 0 else -1 end ,'')<> COALESCE(TRGT.application_key,'');