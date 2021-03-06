 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM png_mdsdb.change_request_final SRC
LEFT JOIN png_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%MULTI_SERVICE_IMPACT_C%' and 
( concat('MULTI_SERVICE_IMPACT_C~CHANGE_REQUEST~~~',upper(u_pg_multi_service_impact))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
  JOIN png_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_pg_multi_service_impact IS NULL THEN 0 else -1 end)<> (TRGT.multi_service_impact_src_c_key);
 
 
 