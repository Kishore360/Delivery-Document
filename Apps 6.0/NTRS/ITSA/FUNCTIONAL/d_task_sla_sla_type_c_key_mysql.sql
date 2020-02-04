SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_sla_c.sla_type_c_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.contract_sla_final SRC
LEFT JOIN ntrustbrn_mdwdb.d_task_sla TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
Left JOIN ntrustbrn_mdwdb.d_lov LKP ON CONCAT('TYPE_C~SLA','~',UPPER(SRC.type))=LKP.row_id  AND SRC.sourceinstance=LKP.source_id
where case when type is NULL then 0 else coalesce(LKP.row_key,-1) end <> TRGT2.sla_type_c_key and SRC.cdctype='X') temp;


