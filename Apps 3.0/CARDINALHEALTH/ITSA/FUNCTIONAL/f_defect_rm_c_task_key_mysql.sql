SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_defect_rm_c.task_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM  cardinalhealth_mdsdb.rm_defect_final SRC 
LEFT JOIN  cardinalhealth_mdwdb.f_defect_rm_c TRGT 
ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
LEFT JOIN cardinalhealth_mdwdb.d_task LKP ON SRC.sys_id=LKP.row_id
AND SRC.sourceinstance= LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.task_c_key))temp;

