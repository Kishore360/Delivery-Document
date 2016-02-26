SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM tjx_mdsdb.cmdb_ci_final SRC
LEFT JOIN tjx_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%BUSINESS_IMPACT~INCIDENT%' and 
( concat('BUSINESS_IMPACT~INCIDENT~~~',u_business_impact)= LKP.rowid 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN tjx_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_business_impact IS NULL THEN 0 else -1 end)<> (TRGT.businesss_impact_c_key)