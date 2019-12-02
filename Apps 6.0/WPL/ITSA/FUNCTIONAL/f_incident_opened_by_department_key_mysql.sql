SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.opened_by_department_key' ELSE 'SUCCESS' END as Message
 
 FROM wpl_mdsdb.incident_final SRC 
 left join  wpl_mdsdb.sys_user_final scu on SRC.opened_by = scu.sys_id
 left join wpl_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  left join   wpl_mdwdb.d_internal_organization LKP
 ON ( concat('DEPARTMENT~',scu.department)= LKP.row_id 
 AND scu.sourceinstance= LKP.source_id )
 AND TRGT.pivot_date
 BETWEEN LKP.effective_from AND LKP.effective_to

 WHERE COALESCE(LKP.row_key,CASE WHEN (scu.department is  null ) THEN 0 else -1 end)<> (TRGT.opened_by_department_key) 
 
 and scu.sys_id is not null and SRC.cdctype='X';