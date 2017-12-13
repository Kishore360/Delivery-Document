SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.site_c_key' ELSE 'SUCCESS' END as Message
 FROM gilead_mdsdb.cmn_location_final SRC 
 LEFT JOIN gilead_mdwdb.d_location TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN gilead_mdwdb.d_location LKP 
 ON ( SRC.u_site= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_site IS NULL THEN 0 else -1 end)<> (TRGT.site_c_key)