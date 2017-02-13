SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM tjx_mdsdb.incident_final SRC
LEFT JOIN tjx_mdsdb. u_location_store_final LKP 
 ON  u_store= LKP.sys_id 
AND SRC.sourceinstance= LKP.sourceinstance  
 LEFT JOIN tjx_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE CONCAT(LKP.u_reference_name,'-',LKP.name) <> (TRGT.store_c))temp;