SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.vendor_c_key' ELSE 'SUCCESS' END as Message 
FROM whirlpool_mdsdb.change_request_final  SRC 
JOIN whirlpool_mdwdb.d_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
join whirlpool_mdsdb.u_cmdb_ci_technical_service_final ref  
on SRC.u_technical_service =ref.sys_id AND ref.sourceinstance= SRC.sourceinstance
 WHERE ref.name <> (TRGT.technical_service_c) 
