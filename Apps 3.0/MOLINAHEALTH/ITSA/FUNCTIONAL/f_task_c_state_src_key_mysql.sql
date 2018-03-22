

SELECT 
CASE WHEN CNT >0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT >0 THEN 'DATA did not Mactch.' ELSE 'DATA Matched' END AS MESSAGE
FROM 
(SELECT count(1) as CNT 
FROM  (select sys_id,sourceinstance,state from molinahealth_mdsdb.task_final where  sys_class_name='INCIDENT') SRC
JOIN molinahealth_mdwdb.f_task_c TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id)
left JOIN molinahealth_mdwdb.d_lov LKP ON
 CONCAT('STATE','~','INCIDENT','~','~','~',UPPER(SRC.state))= LKP.src_rowid 

WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<>TRGT.state_src_key)temp;


