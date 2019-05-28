SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task_sla.business_elapsed_percentage_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM gilead_mdsdb.task_final SRC 
LEFT JOIN gilead_mdsdb.task_sla_final SRC1 ON SRC.sys_id=SRC1.task AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN gilead_mdwdb.f_task_sla TRGT ON SRC1.sys_id=TRGT.row_id AND SRC1.sourceinstance=TRGT.source_id
WHERE SRC1.business_percentage=TRGT.business_elapsed_percentage_c
AND TRGT.soft_deleted_flag='N'
) temp;


