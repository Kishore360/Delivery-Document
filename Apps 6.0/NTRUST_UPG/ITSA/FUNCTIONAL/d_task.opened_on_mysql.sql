select CASE WHEN count(1)>1 THEN 'MDS to DWH data validation failed for d_task.opened_on' ELSE 'SUCCESS' END as Message
FROM  ntrust_mdsdb.task_final SRC
JOIN ntrust_mdwdb.d_task TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id)
where TRGT.opened_on<>(CONVERT_TZ(SRC.opened_at,'UTC','US/Central'))
and SRC.cdctype<>'D';