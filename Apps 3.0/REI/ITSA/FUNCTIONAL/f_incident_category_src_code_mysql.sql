
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.category_src_code' ELSE 'SUCCESS' END as Message
FROM rei_mdsdb.incident_final SRC 
 LEFT JOIN rei_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.u_online_store_incident_catego,'')<>COALESCE(TRGT.category_src_code ,'');