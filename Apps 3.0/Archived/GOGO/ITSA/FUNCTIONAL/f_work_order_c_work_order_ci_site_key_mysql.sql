SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM gogo_mdsdb.wm_order_final SRC 
 LEFT JOIN gogo_mdwdb.f_work_order_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN gogo_mdwdb.d_configuration_item LKP 
 ON ( SRC.u_cmdb_ci_site= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_cmdb_ci_site IS NULL THEN 0 else -1 end)<> (TRGT.work_order_ci_site_key)