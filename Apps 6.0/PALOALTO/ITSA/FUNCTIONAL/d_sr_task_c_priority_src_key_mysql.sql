 
 

 SELECT 
 CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for d_sr_task_c_priority_src_key' ELSE 'SUCCESS' END as Message 
 FROM 
 (Select count(1) as cnt
 FROM paloalto_mdsdb.u_stask_final SRC 
 LEFT JOIN paloalto_mdwdb.d_sr_task_c TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id)
 LEFT JOIN paloalto_mdwdb.d_lov LKP ON 
 (COALESCE( CONCAT('PRIORITY','~','TASK','~',upper(SRC.priority)),'UNSPECIFIED')=LKP.row_id
 AND TRGT.source_id=LKP.source_id)
 WHERE COALESCE (LKP.row_key, CASE WHEN SRC.priority IS NULL THEN 0 ELSE -1 END)<>TRGT.priority_src_key)temp;