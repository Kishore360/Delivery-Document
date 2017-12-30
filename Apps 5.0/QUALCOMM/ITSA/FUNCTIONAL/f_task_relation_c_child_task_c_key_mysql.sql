SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_relation_c.child_task_c_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.task_rel_task_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_task_relation_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 join qualcomm_mdwdb.d_task c
on COALESCE(SRC.child,'UNSPECIFIED')=c.row_id and SRC.sourceinstance=c.source_id
where coalesce(c.row_key, case when SRC.child is null then 0 else -1 end) <> TRGT.child_task_c_key;

