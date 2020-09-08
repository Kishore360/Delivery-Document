SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_sla_c.cmn_schedule_c_key' ELSE 'SUCCESS' END as Message
from(Select Count(1) as CNT
FROM ntrust_mdsdb.contract_sla_final SRC
JOIN ntrust_mdwdb.f_sla_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN ntrust_mdwdb.d_cmn_schedule_c LKP1 ON (SRC.schedule=LKP1.row_id) AND SRC.sourceinstance=LKP1.source_id
WHERE COALESCE(LKP1.row_key,CASE WHEN SRC.schedule is NULL THEN 0 ELSE -1 END)<> TRGT.cmn_schedule_c_key and SRC.cdctype='X' )temp;


