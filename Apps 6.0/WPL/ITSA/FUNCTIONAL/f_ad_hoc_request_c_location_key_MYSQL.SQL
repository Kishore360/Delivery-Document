SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.location_key ' ELSE 'SUCCESS' END as Message
 FROM wpl_mdsdb.u_ad_hoc_request_final SRC 
 LEFT JOIN wpl_mdwdb.d_location LKP 
 ON (COALESCE(SRC.location,'UNSPECIFIED')= LKP.row_id and SRC.sourceinstance=LKP.source_id
AND SRC.sourceinstance= LKP.source_id )
 LEFT JOIN wpl_mdwdb.f_ad_hoc_request_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.location  IS NULL THEN 0 else -1 end)<>(TRGT.location_key)
 and SRC.cdctype='X'