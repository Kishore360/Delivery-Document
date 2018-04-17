

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_c.state_src_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT 
FROM tjx_mdsdb.incident_final SRC 
LEFT JOIN tjx_mdwdb.f_task_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFt JOIN tjx_mdwdb.d_lov LKP ON (CASE WHEN SRC.sys_class_name='INCIDENT' THEN 
COALESCE (CONCAT('STATE','~','INCIDENT','~','~','~',UPPER(SRC.state)),'UNSPECIFIED') END =LKP.src_rowid
AND SRC.sourceinstance= LKP.source_id)
LEFt JOIN tjx_mdwdb.d_lov LKP ON (CASE WHEN SRC.sys_class_name='sc_task' THEN 
ON COALESCE(CONCAT('STATE~SC_TASK~~~',sc_tsk.state),'UNSPECIFIED') = lv_mp.src_rowid 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<>(TRGT.state_src_key)
)temp;