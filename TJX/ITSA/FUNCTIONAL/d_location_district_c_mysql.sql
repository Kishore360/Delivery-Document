SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
FROM tjx_mdsdb.cmn_location_final SRC
LEFT JOIN tjx_mdsdb. u_location_district_final LKP 
 ON  SRC.u_district = LKP.sys_id 
AND SRC.sourceinstance= LKP.sourceinstance 
 LEFT JOIN tjx_mdwdb.d_location TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE LKP. name <> (TRGT.district_c)