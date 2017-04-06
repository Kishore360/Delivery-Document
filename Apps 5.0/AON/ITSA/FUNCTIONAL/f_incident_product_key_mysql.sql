 
SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.product_key' ELSE 'SUCCESS' END as Message  
 FROM (select count(1)cnt from aon_mdsdb.incident_final
 LEFT JOIN aon_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN aon_mdwdb.d_master_item LKP 
 ON ( SRC.u_product = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_product  IS NULL THEN 0 else -1 end)<> (TRGT.product_key))b;
 
 