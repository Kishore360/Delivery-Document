


SELECT 
CASE WHEN CNT >0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT >0 THEN 'DATA did not Mactch.' ELSE 'DATA Matched' END AS MESSAGE
FROM 
(SELECT count(1) as CNT 
FROM rambus_mdsdb.task_final SRC
JOIN rambus_mdwdb.f_task_c TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id)
JOIN rambus_mdwdb.d_lov LKP ON
(CASE WHEN SRC.sys_class_name='U_AD_HOC_REQUEST' THEN
COALESCE( CONCAT('STATE','~','ADHOC_REQ','~','~','~',UPPER(SRC.state)),'UNSPECIFIED') END
= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<>TRGT.state_src_key)temp;