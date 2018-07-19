SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_request_task.assignment_group_key' ELSE 'SUCCESS' END as Message
FROM (
SELECT Count(1) as CNT 
FROM nbcu_mdsdb.sc_task_final SRC 
JOIN nbcu_mdwdb.f_request_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
JOIN nbcu_mdwdb.d_internal_organization LKP  ON ( coalesce(concat('GROUP~',SRC.assignment_group),'UNSPECIFIED')= LKP.row_id AND SRC.sourceinstance= LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else -1 end) <> (TRGT.assignment_group_key)
)temp;


