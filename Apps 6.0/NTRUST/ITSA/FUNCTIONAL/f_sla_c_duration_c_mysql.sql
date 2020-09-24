







SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.contract_sla_final SRC
LEFT JOIN ntrust_mdwdb.f_sla_c TRGT2 ON (b.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
where 
CASE WHEN SRC.duration is null  THEN NULL WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',
SRC.duration) < 0 THEN NULL WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.duration) > 214748364 THEN NULL  ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.duration) 
end)<> TRGT2.duration_c and SRC.cdctype='X') temp;



