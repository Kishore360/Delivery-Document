SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0   THEN 'MDS to DWH data validation failed for d_pbm_main_c.state_c_key' ELSE 'SUCCESS' END as Message 
FROM
(
SELECT 
Count(1) as CNT 
From rogers6_mdsdb.bmc_pbm_main_final SRC
JOIN rogers6_mdwdb.d_lov LKP ON CONCAT('STATE~PBM_TICKET','~',CEIL(SRC.STATE))=LKP.row_id
JOIN rogers6_mdwdb.d_pbm_main_c TRGT ON SRC.PBM_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.STATE IS NULL THEN 0 ELSE -1 END)<>TRGT.state_c_key
AND SRC.cdctype='X'
AND SRC.PBM_ID <> 10
) temp;


 