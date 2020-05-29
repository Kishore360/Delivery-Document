SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_problem.opened_by_department_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 
 FROM   #MDS_TABLE_SCHEMA.incident_final SRC 
left join  #MDS_TABLE_SCHEMA.sys_user_final scu on SRC.caller_id = scu.sys_id and SRC.sourceinstance=scu.sourceinstance
 JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN   #DWH_TABLE_SCHEMA.d_internal_organization LKP
 ON ( concat('DEPARTMENT~',scu.department)= LKP.row_id 
 AND scu.sourceinstance= LKP.source_id )
 AND TRGT.pivot_date
 BETWEEN LKP.effective_from AND LKP.effective_to

 WHERE COALESCE(LKP.row_key,CASE WHEN (scu.department is  null ) THEN 0 else -1 end)<> (TRGT.opened_by_department_key) )b