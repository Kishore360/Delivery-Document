
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_attack_vector.active_flag' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.sn_si_attack_vector_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_attack_vector TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(CASE WHEN(SRC.active=1,'Y','N') END ,'')<> COALESCE(TRGT.active_flag ,'')
