SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_department_key' ELSE 'SUCCESS' END as Message
 
 FROM rei_mdsdb.incident_final SRC 

 JOIN rei_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
 left join  rei_mdwdb.d_internal_contact scu on COALESCE(concat('INTERNAL_CONTACT~',SRC.caller_id),'UNSPECIFIED') = scu.row_id AND SRC.sourceinstance= scu.source_id AND TRGT.pivot_date
 BETWEEN scu.effective_from AND scu.effective_to
 LEFT JOIN   rei_mdwdb.d_internal_organization LKP
 ON ( concat('DEPARTMENT~',scu.department_code)= LKP.row_id 
 AND scu.source_id= LKP.source_id )
  WHERE COALESCE(LKP.row_key,CASE WHEN (scu.department_code is  null ) THEN 0 else -1 end)<> (TRGT.opened_by_department_key) 