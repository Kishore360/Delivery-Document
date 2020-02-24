SELECT CASE WHEN count(1) >1 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>1 THEN 'MDS to DWH data validation failed for f_task_sla.sla_key' ELSE 'SUCCESS' END as Message
FROM ntrustccs_mdsdb.task_sla_final SRC
JOIN ntrustccs_mdwdb.f_task_sla TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
JOIN ntrustccs_mdwdb.d_task_sla LKP
ON SRC.sla=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.sla is null then 0 else -1 end ) <> (TRGT.sla_key)