SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_task.cmo_only_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM keybank_mdsdb.change_task_final SRC 
LEFT JOIN keybank_mdwdb.d_change_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.u_cmo_only,'UNSPECIFIED')<>TRGT.cmo_only_c
AND SRC.cdctype='X' ) temp