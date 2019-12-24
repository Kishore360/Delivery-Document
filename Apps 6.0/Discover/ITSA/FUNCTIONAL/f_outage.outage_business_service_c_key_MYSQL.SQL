SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_outage.outage_business_service_c_key' ELSE 'SUCCESS' END as Message FROM discover_mdsdb.cmdb_ci_outage_final  SRC 
JOIN discover_mdwdb.f_outage TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN discover_mdwdb.d_service LKP ON ( concat( 'BUSINESS_SERVICE~' ,upper( SRC.u_business_service)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_business_service IS NULL THEN 0 else -1 end)<> (TRGT.outage_business_service_c_key) 
 
 
 

