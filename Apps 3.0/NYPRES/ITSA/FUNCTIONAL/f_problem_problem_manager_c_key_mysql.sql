 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.problem_final SRC
 LEFT JOIN nypres_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN nypres_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',u_problem_manager )= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id
AND COALESCE(CONVERT_TZ (SRC.opened_at,'GMT','America/New_york'), CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),'GMT','America/New_york')BETWEEN LKP.effective_from AND LKP.effective_to) )
where COALESCE(LKP.row_key,CASE WHEN SRC.u_problem_manager  IS NULL THEN 0 else -1 end) <> (TRGT.problem_manager_c_key) ;

	