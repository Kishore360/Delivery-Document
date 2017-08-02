
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.task_key     ' ELSE 'SUCCESS' END as Message 
FROM molinahealth_mdwdb.d_task_sla trgt
RIGHT JOIN molinahealth_mdsdb.task_sla_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdwdb.d_task lkp
ON src.task = lkp.row_id AND src.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key, CASE WHEN src.task IS NULL THEN 0 ELSE -1 end) <> coalesce(task_key,0)
;

