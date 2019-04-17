SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_department_key' ELSE 'SUCCESS' END as Message

FROM rambus_mdsdb.incident_final SRC 
left join  rambus_mdsdb.sys_user_final scu on SRC.u_affected_client  = scu.sys_id
JOIN rambus_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN   rambus_mdwdb.d_internal_organization LKP
ON ( concat('DEPARTMENT~',scu.department)= LKP.row_id 
 AND scu.sourceinstance= LKP.source_id )
WHERE DATE_FORMAT(TRGT.pivot_date, '%Y-%m-%d %H:%i:%s')
AND (TRGT.pivot_date BETWEEN LKP.effective_from AND LKP.effective_to)


COALESCE(LKP.row_key,CASE WHEN (scu.department is  null ) THEN 0 else -1 end) <> (TRGT.opened_by_department_key)  
