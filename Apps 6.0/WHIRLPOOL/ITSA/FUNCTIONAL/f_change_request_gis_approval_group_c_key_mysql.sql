SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.gis_approval_group_c_key' ELSE 'SUCCESS' END as Message 
FROM whirlpool_mdsdb.change_request_final  SRC 
JOIN whirlpool_mdwdb.f_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN whirlpool_mdwdb.d_internal_organization LKP 
ON ( concat( 'GROUP~' ,upper( SRC.u_gis_approval_group)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_gis_approval_group IS NULL THEN 0 else -1 end)<> (TRGT.gis_approval_group_c_key) 
and SRC.cdctype='X'
