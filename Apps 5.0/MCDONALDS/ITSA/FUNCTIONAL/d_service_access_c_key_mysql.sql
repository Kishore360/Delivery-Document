SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.u_access' ELSE 'SUCCESS' END as Message 
FROM (select * from mcdonalds_mdsdb.cmdb_ci_service_final where cdctype<>'D') SRC 
JOIN mcdonalds_mdwdb.d_service TRGT 
ON (concat( 'BUSINESS_SERVICE~' ,SRC.sys_id) = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN mcdonalds_mdwdb.d_lov LKP 
ON ( concat( 'U_ACCESS_C~CMDB_CI_SERVICE~~~' ,upper( SRC.u_access)) = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)  
where (src.cdctime<=f1.lastupdated) and COALESCE(LKP.row_key,CASE WHEN SRC.u_access IS NULL THEN 0 else -1 end)<> (TRGT.access_c_key) 
