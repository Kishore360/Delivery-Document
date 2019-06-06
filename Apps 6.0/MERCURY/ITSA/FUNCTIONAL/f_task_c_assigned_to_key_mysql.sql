SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.task_final SRC
JOIN mercury_mdwdb.f_task_c TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
join mercury_mdwdb.d_internal_contact LKP
on case when SRC.assigned_to is null then 'UNSPECIFIED' else concat('INTERNAL_CONTACT~',SRC.assigned_to) end=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.assigned_to is null then  0 else -1 end )<>TRGT.assigned_to_key
