SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from cardinalhealth_mdsdb.task_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.d_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE coalesce(SRC.description,'UNSPECIFIED') <> TRGT.description and TRGT.soft_deleted_flag<>'Y')ma;
 
 