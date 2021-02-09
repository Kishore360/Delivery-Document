SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_pbm_main_c.pbm_main_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
FROM rogers6_mdsdb.bmc_pbm_main_final SRC 
JOIN rogers6_mdwdb.f_pbm_main_c TRGT ON SRC.PBM_ID=TRGT.row_id AND SRC.sourceinstance =TRGT.source_id 
JOIN rogers6_mdwdb.d_pbm_main_c LKP ON  SRC.PBM_ID=LKP.row_id AND SRC.sourceinstance =LKP.source_id 
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.PBM_ID IS NULL THEN 0 ELSE -1 END) <> TRGT.pbm_main_c_key
AND SRC.cdctype='X'
) temp;


