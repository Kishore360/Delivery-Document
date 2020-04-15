
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 
'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.task_state_key' ELSE 'SUCCESS' END as Message

FROM 
( Select Count(1) as CNT
FROM  ingrammicro_mdsdb.u_server_modification_task_final SRC 
LEFT JOIN ingrammicro_mdwdb.f_u_server_modification_task_fact_c TRGT
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN ingrammicro_mdwdb.d_lov LKP ON
COALESCE(CONCAT('STATE','~','TASK','~',UPPER(SRC.state)),'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id

WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency iS NULL THEN 0 ELSE -1 END)<>TRGT.task_state_key

AND TRGT.soft_deleted_flag='N' ) temp;
