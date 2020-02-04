SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_sla_c.duration_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
FROM ntrust_mdsdb.contract_sla_final SRC
JOIN ntrustbrn_mdwdb.f_sla_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE timestampdiff(second,'1970-01-01 00:00:00',SRC.duration)<>TRGT.duration_c
AND SRC.cdctype='X' ) temp; 