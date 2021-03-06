SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.implementation_result_src_c_key' 
ELSE 'SUCCESS' END as Message 
FROM whirlpool_mdsdb.change_request_final  SRC 
JOIN whirlpool_mdwdb.f_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN whirlpool_mdwdb.d_lov LKP 
ON ( concat( 'U_IMPLEMENTATION_RESULT~CHANGE_REQUEST~~~' ,upper( SRC.u_implementation_result)) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id ) 
JOIN whirlpool_mdwdb.d_lov_map br on 
TRGT.implementation_result_src_c_key = br.src_key
AND TRGT.source_id =br.source_id
AND br.dimension_wh_code = 'Unsuccessful' 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_implementation_result IS NULL THEN 0 else -1 end)<> (TRGT.implementation_result_src_c_key) 

and SRC.cdctype='X'