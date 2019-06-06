SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.opened_by_department_key' ELSE 'SUCCESS' END as Message
 
 FROM mercury_mdsdb.u_asc_ticket_final SRC 
 LEFT JOIN mercury_mdsdb.sys_user_final LOKP
 on LOKP.sys_id=SRC.u_caller
 JOIN mercury_mdwdb.f_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )

 
 LEFT JOIN   mercury_mdwdb.d_internal_organization LKP
 ON ( concat('DEPARTMENT~',LOKP.department)= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id )


 
 WHERE COALESCE(LKP.row_key,CASE WHEN ( LOKP.department IS NULL 
 or SRC.u_caller is  null)
 THEN 0 else -1 end)<> (TRGT.asc_incident_opened_by_department_c_key)