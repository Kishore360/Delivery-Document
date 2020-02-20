SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task_sla.stage_src_key' ELSE 'SUCCESS' END as Message
FROM
(Select count(1) CNT
FROM  ntrust_mds_viewdb.task_sla_final SRC
LEFT JOIN ntrustccs_mdwdb.f_task_sla TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
Left JOIN ntrustccs_mdwdb.d_lov LKP ON CONCAT('STAGE~TASK_SLA','~',UPPER(SRC.stage))=LKP.row_id  AND SRC.sourceinstance=LKP.source_id
where case when stage is NULL then 0 else coalesce(LKP.row_key,-1) end <> TRGT2.stage_src_key and SRC.cdctype='X')temp