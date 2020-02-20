SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_task.priority_src_key' ELSE 'SUCCESS' END as Message
FROM
(Select count(1) CNT
FROM  ntrust_mds_viewdb.task_final SRC
JOIN ntrustccs_mdwdb.d_task TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
Left JOIN ntrustccs_mdwdb.d_lov LKP ON CONCAT('PRIORITY~TASK','~',UPPER(SRC.priority))=LKP.row_id  AND SRC.sourceinstance=LKP.source_id
where case when priority is NULL then 0 else coalesce(LKP.row_key,-1) end <> TRGT2.priority_src_key and SRC.cdctype='X')temp