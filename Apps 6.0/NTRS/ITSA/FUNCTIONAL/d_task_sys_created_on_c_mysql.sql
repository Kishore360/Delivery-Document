SELECT CASE WHEN count(1) >1 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>1 THEN 'MDS to DWH data validation failed for d_task.sys_created_on_c' ELSE 'SUCCESS' END as Message
FROM  ntrust_mds_viewdb.task_final SRC
JOIN ntrust_mdwdb.d_task TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id)
where TRGT.sys_created_on_c <> (CONVERT_TZ(SRC.sys_created_on,'GMT','US/Central'))
and SRC.cdctype<>'D';