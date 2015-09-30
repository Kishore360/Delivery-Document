

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.domain_key' ELSE 'SUCCESS' END as Message from(
select 
COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else '-1' end)abc, COALESCE(TRGT.domain_key,'')def
 FROM <<tenant>>_mdsdb.incident_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_domain LKP 
 ON ( SRC.sys_domain= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ))a
 WHERE abc<>def
