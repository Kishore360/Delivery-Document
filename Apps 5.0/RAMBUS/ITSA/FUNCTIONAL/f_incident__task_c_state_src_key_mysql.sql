SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN CNT > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM 
(SELECT COUNT(1) AS CNT 
FROM rambus_mdsdb.incident_final SRC 
JOIN rambus_mdwdb.d_task TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id)
JOIN rambus_mdwdb.d_lov LKP ON 
(CASE WHEN SRC.sys_class_name='INCIDENT' THEN
COALESCE(CONCAT('STATE','~','INCIDENT','~','~','~',UPPER(SRC.state)),'UNSPECIFIED') END
= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<>TRGT.state_src_key)temp;