SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 
'MDS to DWH data validation failed for d_task_sla.contract_sla_type_c_key' ELSE 'SUCCESS' END as Message
FROM 
( Select count(1) as CNT
FROM  ingrammicro_mdsdb.contract_sla_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_task_sla TRGT
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left JOIN ingrammicro_mdwdb.d_lov LKP ON
COALESCE(CONCAT('TYPE_C','~','CONTRACT_SLA','~','','',UPPER(SRC.type)),
                'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.type iS NULL THEN 0 ELSE -1 END) <> TRGT.contract_sla_type_c_key
AND TRGT.soft_deleted_flag='N' ) temp;