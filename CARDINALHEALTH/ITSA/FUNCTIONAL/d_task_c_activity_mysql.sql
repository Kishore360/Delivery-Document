 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.task_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.d_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE   CASE WHEN SRC.active=TRUE THEN 'Y' ELSE 'N' END <> activity