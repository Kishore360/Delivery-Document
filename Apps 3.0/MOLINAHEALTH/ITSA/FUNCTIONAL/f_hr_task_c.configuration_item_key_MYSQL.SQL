
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_hr_task_c.configuration_item_key' ELSE 'SUCCESS' END as Message
FROM 
( SELECT Count(1) AS CNT 
FROM molinahealth_mdsdb.u_hr_task_final SRC 
LEFT JOIN  molinahealth_mdwdb.f_hr_task_c TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN  molinahealth_mdwdb.d_configuration_item LKP  ON (SRC.cmdb_ci = LKP.row_id AND SRC.sourceinstance = LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 else -1 end)<> TRGT.configuration_item_key
) a; 


 