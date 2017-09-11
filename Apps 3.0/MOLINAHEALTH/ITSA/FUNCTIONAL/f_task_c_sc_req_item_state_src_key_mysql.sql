SELECT 
CASE WHEN CNT >0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT >0 THEN 'DATA did not Mactch.' ELSE 'DATA Matched' END AS MESSAGE
FROM 
(
SELECT TRGT.row_id,SRC.sys_id,SRC.state,TRGT.pivot_date
,COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end),TRGT.state_src_key
FROM molinahealth_mdsdb.task_final SRC
JOIN molinahealth_mdwdb.f_task_c TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id)
JOIN molinahealth_mdwdb.d_lov LKP ON
(CASE WHEN SRC.sys_class_name='SC_REQ_ITEM' THEN
COALESCE( CONCAT('STATE','~','SC_REQ_ITEM','~','~','~',UPPER(SRC.state)),'UNSPECIFIED') END
= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id AND TRGT.pivot_date BETWEEN LKP.effective_from and LKP.effective_to)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<>TRGT.state_src_key
)temp;