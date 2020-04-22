SELECT CASE WHEN count(1) >1 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>1 THEN 'MDS to DWH data validation failed for f_task_sla.outcome_flag' ELSE 'SUCCESS' END as Message
FROM ntrust_mdsdb.task_sla_final SRC
JOIN
                ntrust_mdsdb.task_final task 
                    ON task.sys_id=SRC.task 
                    and task.sourceinstance=SRC.sourceinstance  and task.sys_class_name in ('incident','problem')
JOIN ntrust_mdwdb.f_task_sla TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
WHERE case when SRC.has_breached=TRUE then 'Y' else 'N' end <> (TRGT.outcome_flag) and SRC.cdctype<>'D';