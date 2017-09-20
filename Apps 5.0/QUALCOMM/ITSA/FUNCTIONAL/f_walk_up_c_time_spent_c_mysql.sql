SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM qualcomm_mdsdb.u_walk_up_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_walk_up_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.time_spent)<> COALESCE(TRGT.time_spent_c,'') ;