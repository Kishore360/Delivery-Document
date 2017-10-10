

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_c.state_src_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT 
FROM nbcu_mdsdb.incident_final SRC 
LEFT JOIN nbcu_mdwdb.f_task_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFt JOIN nbcu_mdwdb.d_lov LKP ON (CASE WHEN SRC.sys_class_name='INCIDENT' THEN 
COALESCE (CONCAT('STATE','~','INCIDENT','~','~','~',UPPER(SRC.state)),'UNSPECIFIED') END =LKP.src_rowid
AND SRC.sourceinstance= LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<>(TRGT.state_src_key)
)temp;