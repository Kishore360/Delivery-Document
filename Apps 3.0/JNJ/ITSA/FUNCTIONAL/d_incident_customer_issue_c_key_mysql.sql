SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM jnj_mdsdb.incident_final SRC
LEFT JOIN jnj_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%CUSTOMER_ISSUE_C%' and 
( concat('CUSTOMER_ISSUE_C~INCIDENT~~~',u_customer_issue)= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN jnj_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_customer_issue IS NULL THEN 0 else -1 end)<> (TRGT.customer_issue_c_key)
 
 