SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (
SELECT count(1) as CNT
FROM paloalto_mdsdb.u_stask_final SRC 
JOIN paloalto_mdwdb.f_sr_task_c TRGT ON (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
JOIN paloalto_mdwdb.d_internal_organization LKP ON
(LKP.row_id =CONCAT('GROUP~',SRC.assignment_group) and SRC.sourceinstance= LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else -1 end)<>(TRGT.assignment_group_key)
)temp;