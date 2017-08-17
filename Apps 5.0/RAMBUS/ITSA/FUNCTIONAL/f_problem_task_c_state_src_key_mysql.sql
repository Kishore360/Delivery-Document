

SELECT 
CASE WHEN CNT >0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT >0 THEN 'DATA did not Mactch.' ELSE 'DATA Matched' END AS MESSAGE
FROM 
(SELECT count(1) as CNT 
FROM rambus_mdsdb.problem_task_final SRC
JOIN rambus_mdwdb.f_problem_task TRGT 
ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id)
JOIN rambus_mdwdb.d_lov LKP ON
(CASE WHEN SRC.sys_class_name='problem_task' THEN
COALESCE(CONCAT('STATE','~','problem_task','~','~','~',UPPER(SRC.STATE)),'UNSPECIFIED') END
= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<>TRGT.state_src_key)temp;

