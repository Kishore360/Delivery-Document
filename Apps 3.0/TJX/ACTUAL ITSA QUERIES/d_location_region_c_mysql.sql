SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM tjx_mdsdb.cmn_location_final SRC
LEFT JOIN tjx_mdsdb. u_location_district_final LKP 
 ON  SRC.u_district = LKP.sys_id 
AND SRC.sourceinstance= LKP.sourceinstance 
LEFT JOIN tjx_mdsdb. u_location_region_final LKP1 
 ON  LKP.u_region = LKP1.sys_id 
AND LKP.sourceinstance= LKP1.sourceinstance 
 LEFT JOIN tjx_mdwdb.d_location TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE LKP1. name <> (TRGT.region_c))temp;