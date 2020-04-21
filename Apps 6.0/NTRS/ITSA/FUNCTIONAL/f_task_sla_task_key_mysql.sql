SELECT CASE WHEN count(1) >1 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>1 THEN 'MDS to DWH data validation failed for f_task_sla.task_key' ELSE 'SUCCESS' END as Message
FROM  ntrust_mds_viewdb.task_sla_final SRC
JOIN
                ntrust_mdsdb.task_final task 
                    ON task.sys_id=SRC.task 
                    and task.sourceinstance=SRC.sourceinstance 
JOIN ntrust_mdwdb.f_task_sla TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id)
join ntrust_mdwdb.d_task Lkp on (task.sys_id=Lkp.row_id)
WHERE COALESCE(Lkp.row_key,CASE WHEN SRC.task is NULL THEN 0 ELSE -1 END) <> TRGT.task_key
and SRC.cdctype<>'D';