SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_sla_c.sla_key' ELSE 'SUCCESS' END as Message
from(Select Count(1) as CNT
FROM ntrust_mdsdb.contract_sla_final SRC
JOIN ntrustbrn_mdwdb.f_sla_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN ntrustbrn_mdwdb.d_task_sla LKP1 ON (SRC.sys_id=LKP1.row_id) AND SRC.sourceinstance=LKP1.source_id
WHERE COALESCE(LKP1.row_key,CASE WHEN SRC.sys_id is NULL THEN 0 ELSE -1 END)<>TRGT.sla_key and SRC.cdctype='X')  temp;


