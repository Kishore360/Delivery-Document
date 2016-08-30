
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.category_src_key' ELSE 'SUCCESS' END as Message from 
(select count(1) as cnt
FROM rei_mdsdb.incident_final SRC 
LEFT JOIN rei_mdwdb.d_lov LKP 
 ON 
  concat('CATEGORY~INCIDENT~~~',SRC.u_online_store_incident_catego)=  LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 LEFT JOIN rei_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_online_store_incident_catego IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.category_src_key,'')) a