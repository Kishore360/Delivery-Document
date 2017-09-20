SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_walk_up_c.sys_mod_count_c' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.u_walk_up_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_walk_up_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE TRGT.sys_mod_count_c<> SRC.sys_mod_count;
