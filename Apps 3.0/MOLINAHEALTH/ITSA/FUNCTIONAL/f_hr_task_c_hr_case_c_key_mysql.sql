
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.u_hr_task_final SRC
 left join molinahealth_mdsdb.u_hr_case_final LKP on SRC.parent=LKP.sys_id  AND SRC.sourceinstance= LKP.sourceinstance 
 LEFT JOIN molinahealth_mdwdb.d_hr_case_c TRGT 
 ON ( TRGT.row_id =  LKP.sys_id  
 AND LKP.sourceinstance= TRGT.source_id  )
 JOIN molinahealth_mdwdb.f_hr_task_c LKP2 
 ON (SRC.sys_id =LKP2.row_id  
 AND SRC.sourceinstance= LKP2.source_id  )
WHERE LKP2.hr_case_c_key<>TRGT.row_key

