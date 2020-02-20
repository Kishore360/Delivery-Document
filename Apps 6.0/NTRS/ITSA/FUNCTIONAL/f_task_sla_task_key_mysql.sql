SELECT CASE WHEN count(1) >1 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>1 THEN 'MDS to DWH data validation failed for f_task_sla.task_key' ELSE 'SUCCESS' END as Message
FROM  ntrust_mds_viewdb.task_sla_final SRC
JOIN ntrustccs_mdwdb.f_task_sla TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id)
join ntrustccs_mdwdb.d_task Lkp on (SRC.task=Lkp.row_id)
WHERE COALESCE(Lkp.row_key,CASE WHEN SRC.task is NULL THEN 0 ELSE -1 END) <> TRGT.task_key
and SRC.cdctype<>'D';