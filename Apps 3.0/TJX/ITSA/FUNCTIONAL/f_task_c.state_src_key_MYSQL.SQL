SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_c.state_src_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as cnt 
FROM tjx_mdsdb.task_final SRC 
join tjx_mdsdb.incident_final src1 on SRC.sys_id=src1.sys_id and SRC.sourceinstance=src1.sourceinstance
 JOIN tjx_mdwdb.f_task_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFt JOIN tjx_mdwdb.d_lov LKP ON ( COALESCE(CONCAT('STATE','~','INCIDENT','~','~','~',UPPER(src1.incident_state)),'UNSPECIFIED') =LKP.row_id
AND SRC.sourceinstance= LKP.source_id)
 WHERE COALESCE(LKP.row_key,CASE WHEN src1.incident_state IS NULL THEN 0 else -1 end)<>(TRGT.state_src_key)
 and TRGT.soft_deleted_flag='N'
)temp;

