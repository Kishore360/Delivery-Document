SELECT CASE WHEN count(1) >1 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>1 THEN 'MDS to DWH data validation failed for f_task_sla.end_on' ELSE 'SUCCESS' END as Message
FROM ntrust_mdsdb.task_sla_final SRC
JOIN ntrust_mdwdb.f_task_sla TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
WHERE convert_tz(SRC.end_time,'GMT','US/Central') <> (TRGT.end_on)
and SRC.cdctype<>'D';