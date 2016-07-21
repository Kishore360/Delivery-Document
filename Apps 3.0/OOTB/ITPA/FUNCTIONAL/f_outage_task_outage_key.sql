
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage_task.outage_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.task_outage_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_outage_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.d_outage LKP 
 ON ( SRC.outage = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.outage IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.outage_key ,'')