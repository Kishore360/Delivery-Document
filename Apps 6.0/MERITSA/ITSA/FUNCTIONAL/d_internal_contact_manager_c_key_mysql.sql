SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdsdb.sys_user_final  SRC 
JOIN meritsa_mdwdb.d_internal_contact TRGT 
ON (concat('INTERNAL_CONTACT~',SRC.sys_id) = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype='X'
join meritsa_mdwdb.d_internal_contact LKP
on coalesce(concat('INTERNAL_CONTACT~',SRC.manager),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.manager is null then  0 else -1 end )<>TRGT.manager_c_key
