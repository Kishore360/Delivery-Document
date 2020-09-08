SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_task_sla.contract_sla_type_c_key' ELSE 'SUCCESS' END as Message
FROM
(Select count(1) CNT
FROM  ntrust_mds_viewdb.contract_sla_final SRC
LEFT JOIN ntrust_mdwdb.d_task_sla TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
Left JOIN ntrust_mdwdb.d_lov LKP ON CONCAT('TYPE~CONTRACT_SLA','~',UPPER(SRC.type))=LKP.row_id  AND SRC.sourceinstance=LKP.source_id
where case when type is NULL then 0 else coalesce(LKP.row_key,-1) end <> TRGT2.contract_sla_type_c_key and SRC.cdctype='X')temp