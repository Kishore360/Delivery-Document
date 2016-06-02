SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.opened_by_department_key' ELSE 'SUCCESS' END as Message
 FROM homedepot_mdsdb.incident_final SRC 
 JOIN homedepot_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
join homedepot_mdwdb.d_calendar_date LKP
on COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.u_major_incident_declared,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED') = LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_major_incident_declared IS NULL THEN 0 else -1 end)<> TRGT.major_incident_declared_c_key