SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_task_ci_c.configuration_item_key' ELSE 'SUCCESS' END as Message
FROM 
	(select  count(1) as cnt  from nbcu_mdsdb.task_ci_final SRC
JOIN nbcu_mdwdb.d_configuration_item LKP 
	ON (SRC.ci_item =LKP.row_id AND SRC.sourceinstance= LKP.source_id)
JOIN nbcu_mdwdb.f_task_ci_c TRGT 
	ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE  COALESCE(LKP.row_key,CASE WHEN SRC.task IS NULL THEN 0 else -1 end)<>TRGT.configuration_item_key)ma


