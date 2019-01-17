SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.lawful_basis_stats_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM pandg_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN  pandg_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN pandg_mdwdb.d_lov  LKP ON COALESCE(CONCAT('OT_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~',SRC.LAWFULNESS_BASIS_STATUS),'UNSPECIFIED')=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.LAWFULNESS_BASIS_STATUS IS NULL THEN 0 ELSE -1 END)<>TRGT.lawful_basis_stats_c_key
AND SRC.cdctype<>'D'
) temp;




