 SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.closed_by_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM <<tenant>>_mdsdb.incident_final SRC 
  JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
   JOIN <<tenant>>_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key AND dlm.dimension_wh_code = 'CLOSED'
LEFT JOIN <<tenant>>_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',closed_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
AND TRGT.pivot_date
 BETWEEN LKP.effective_from AND LKP.effective_to) 

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.closed_by_key) )b
 