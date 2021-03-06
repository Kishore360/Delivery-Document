SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Message
 FROM rambus_mdsdb.task_final SRC 
 JOIN rambus_mdwdb.d_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN rambus_mdwdb.d_lov LKP 
 ON (CONCAT('PRIORITY','~','TASK','~','~','~',UPPER(SRC.priority))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id)
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.priority_src_key)
 
