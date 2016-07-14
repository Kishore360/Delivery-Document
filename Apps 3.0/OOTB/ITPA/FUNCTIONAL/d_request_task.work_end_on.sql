SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.work_end_on' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.sc_task_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE convert_tz(SRC.work_end,'GMT','America/Los_Angeles') <> TRGT.work_end_on 
 
