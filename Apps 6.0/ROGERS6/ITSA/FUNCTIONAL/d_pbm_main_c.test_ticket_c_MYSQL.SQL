SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0   THEN 'MDS to DWH data validation failed for d_pbm_main_c.test_ticket_c' ELSE 'SUCCESS' END as Message 
FROM
(
SELECT 
Count(1) as CNT 
From rogers6_mdsdb.bmc_pbm_main_final SRC
JOIN rogers6_mdwdb.d_pbm_main_c TRGT ON SRC.PBM_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(ceil(SRC.TEST_TICKET)) <> TRGT.test_ticket_c
AND SRC.cdctype='X'
) temp;

