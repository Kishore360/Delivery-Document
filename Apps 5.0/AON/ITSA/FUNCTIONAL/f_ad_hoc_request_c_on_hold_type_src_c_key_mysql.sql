SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.on_hold_type_src_c_key' 
ELSE 'SUCCESS' END as Message 
FROM aon_mdsdb.u_ad_hoc_request_final  SRC 
JOIN aon_mdwdb.f_ad_hoc_request_c TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN aon_mdwdb.d_lov LKP 
 ON ( concat( 'U_ON_HOLD_TYPE_C~U_AD_HOC_REQUEST~~~' ,upper( SRC.u_on_hold_type)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_on_hold_type IS NULL THEN 0 else -1 end)<> (TRGT.on_hold_type_src_c_key) 
