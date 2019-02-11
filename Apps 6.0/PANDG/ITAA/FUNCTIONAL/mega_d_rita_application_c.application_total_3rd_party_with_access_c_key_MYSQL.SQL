
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.application_total_3rd_party_with_access_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id AND SRC.cdctype<>'D'
JOIN png_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('OT_THIRD_PARTY_USERS_C','~','PROCESSING_ACTIVITIES','~',upper(SRC.TOTAL_3RD_PARTY_WITH_ACCESS)),'UNSPECIFIED')=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN upper(SRC.TOTAL_3RD_PARTY_WITH_ACCESS) IS NULL THEN 0 ELSE -1 END)<>TRGT.application_total_3rd_party_with_access_c_key
) temp;



