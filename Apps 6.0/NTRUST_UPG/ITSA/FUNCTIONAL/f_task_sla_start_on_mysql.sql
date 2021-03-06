SELECT CASE WHEN count(1) >1 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>1 THEN 'MDS to DWH data validation failed for f_task_sla.start_on' ELSE 'SUCCESS' END as Message
FROM ntrust_mds_viewdb.task_sla_final SRC
JOIN ntrust_mdwdb.f_task_sla TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
WHERE convert_tz(SRC.start_time,'GMT','America/Los_Angeles') <> (TRGT.start_on)
and SRC.cdctype<>'D';