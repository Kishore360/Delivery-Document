SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.u_hr_task_final SRC
 LEFT JOIN molinahealth_mdwdb.d_hr_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN molinahealth_mdwdb.f_hr_task_c LKP 
 ON (SRC.sys_id =LKP.row_id  
 AND SRC.sourceinstance= LKP.source_id  )
WHERE coalesce(TRGT.row_key,case when SRC.sys_id is null then 0 else -1 end  ) <> (LKP.hr_task_c_key) 

