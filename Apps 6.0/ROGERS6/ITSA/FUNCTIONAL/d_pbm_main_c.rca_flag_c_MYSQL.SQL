SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0   THEN 'MDS to DWH data validation failed for d_pbm_main_c.rca_flag_c' ELSE 'SUCCESS' END as Message 
FROM
(
SELECT 
Count(1) as CNT 
From rogers6_mdsdb.bmc_pbm_main_final SRC
JOIN rogers6_mdwdb.d_pbm_main_c TRGT ON SRC.PBM_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
CASE
WHEN ((SRC.CATEGORY = 'Root Cause Management'
and SRC.TYPE ='Root Cause Management')
OR (SRC.CATEGORY ='Problem Management' AND SRC.TYPE IN ('P2 due to Change' ,'Special Request')))
AND coalesce(SRC.CLOSURE_CODE,'UNSPECIFIED') not in ('Cancelled','Duplicate') and SRC.INITIAL_SUBMISSION_DATE is not NULL
AND CEIL(SRC.STATE) <> 0 THEN 'Y' ELSE 'N' END <> TRGT.rca_flag_c
) temp;


