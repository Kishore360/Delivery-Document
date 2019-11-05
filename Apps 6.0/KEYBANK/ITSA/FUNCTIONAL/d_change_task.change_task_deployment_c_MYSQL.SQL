SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_task.change_task_deployment_c' ELSE 'SUCCESS' END as Message
FROM 
( Select Count(1) as CNT
FROM  keybank_mdsdb.change_task_final SRC 
LEFT JOIN keybank_mdwdb.d_change_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)

WHERE COALESCE( SRC.u_deployment_tool,'UNSPECIFIED')<>TRGT.change_task_deployment_c
AND TRGT.soft_deleted_flag='N' and SRC.cdctype='X') temp;
