
SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM qualcomm_mdsdb.u_walk_up_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_walk_up_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
join qualcomm_mdwdb.d_task_c c
on  COALESCE(SRC.transferred_to,'UNSPECIFIED')=c.row_id and SRC.sourceinstance=c.source_id
where coalesce(c.row_key,case when SRC.transferred_to is null then 0 else -1 end ) <> TRGT.transferred_to_c_key;


