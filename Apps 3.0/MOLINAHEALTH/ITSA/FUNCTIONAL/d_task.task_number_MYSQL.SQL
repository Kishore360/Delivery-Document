

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task.task_number' ELSE 'SUCCESS' END as Message
FROM 
( 
SELECT Count(1) as CNT 
FROM molinahealth_mdsdb.task_final SRC
JOIN molinahealth_mdwdb.d_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.number,'UNSPECIFIED')<>TRGT.task_number
) a; 


