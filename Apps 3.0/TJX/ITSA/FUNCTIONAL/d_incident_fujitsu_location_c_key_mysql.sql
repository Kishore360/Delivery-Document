SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN  CNT >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM tjx_mdsdb.incident_final SRC
LEFT JOIN tjx_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%FUJITSU_LOCATION~INCIDENT%' and 
( concat('FUJITSU_LOCATION~INCIDENT~~~',u_fujitsu_location)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
 JOIN tjx_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_fujitsu_location IS NULL THEN 0 else -1 end)<> (TRGT.fujitsu_location_c_key))temp;