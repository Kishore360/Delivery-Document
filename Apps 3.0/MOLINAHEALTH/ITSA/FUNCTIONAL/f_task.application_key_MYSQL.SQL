
SELECT 
CASE WHEN CNT  > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT  > 0 THEN 'MDS to DWH data validation failed for f_task.application_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM molinahealth_mdsdb.task_final SRC 
LEFT JOIN molinahealth_mdwdb.f_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN molinahealth_mdwdb.d_application LKP ON (CONCAT('APPLICATION~',SRC.cmdb_ci)=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
WHERE (COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULl THEN 0 ELSE -1 END) <>TRGT.application_key)
) a; 