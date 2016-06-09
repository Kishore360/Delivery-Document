

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.category_src_key' ELSE 'SUCCESS' END as Message from (
select count(1) as cnt   
FROM mercuryinsurance_mdsdb.u_asc_ticket_final SRC 
LEFT JOIN mercuryinsurance_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%CATEGORY~ASC_INCIDENT%' and
  concat('CATEGORY~ASC_INCIDENT~~~',upper(category ))=  LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id 
 LEFT JOIN mercuryinsurance_mdwdb.f_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.category IS NULL THEN 0 else -1 end)<> (TRGT.asc_incident_category_c_key))a