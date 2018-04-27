


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.due_on' ELSE 'SUCCESS' END as Message
  FROM tjx_mdsdb.change_task_final SRC 
 LEFT JOIN tjx_mdwdb.d_change_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE convert_tz(SRC.due_date,'GMT','America/New_York') <> TRGT.due_on 
