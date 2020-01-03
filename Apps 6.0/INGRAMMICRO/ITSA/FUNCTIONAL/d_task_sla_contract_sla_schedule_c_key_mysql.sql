SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_task_sla.contract_sla_schedule_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select count(1) as CNT
FROM ingrammicro_mdsdb.contract_sla_final SRC 
JOIN ingrammicro_mdwdb.d_task_sla TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left join ingrammicro_mdsdb.cmn_schedule_final SRC1 on SRC.sys_id=SRC.schedule
JOIN ingrammicro_mdwdb.d_cmn_schedule_c LKP ON LKP.row_id=
COALESCE(SRC.schedule,'UNSPECIFIED') and SRC.sourceinstance=LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.schedule is NULL THEN 0 ELSE -1 END)<>TRGT.contract_sla_schedule_c_key) temp;