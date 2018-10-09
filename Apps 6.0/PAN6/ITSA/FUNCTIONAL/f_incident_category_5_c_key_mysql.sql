

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.sub_category_src_key' ELSE 'SUCCESS' END as Message
 FROM pan6_mdsdb.incident_final SRC 
  JOIN pan6_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN pan6_mdwdb.d_category_c  LKP 
 ON ((u_category_5)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_category_5 IS NULL THEN 0 else -1 end)<>(TRGT.category_5_c_key)
 
 
 