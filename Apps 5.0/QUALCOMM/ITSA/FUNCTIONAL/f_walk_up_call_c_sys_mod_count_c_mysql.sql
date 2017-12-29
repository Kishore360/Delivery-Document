SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM qualcomm_mdsdb.u_walk_up_call_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_walk_up_call_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE SRC.sys_mod_count<> TRGT.sys_mod_count_c ;