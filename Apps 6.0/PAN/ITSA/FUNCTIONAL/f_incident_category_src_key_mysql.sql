

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.category_src_key' ELSE 'SUCCESS' END as Message from (
select count(1) as cnt   
FROM pan_mdsdb.incident_final SRC 
LEFT JOIN pan_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%CATEGORY~INCIDENT%' and
  concat('CATEGORY~INCIDENT~~~',upper(u_category ))=  LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id 
 LEFT JOIN pan_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_category IS NULL THEN 0 else -1 end)<> (TRGT.category_src_key))a