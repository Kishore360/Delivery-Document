SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.pg_bia_rating_for_integrity_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN png_mdwdb.d_lov LKP ON (CONCAT('INTEGRITY_RATING','~','MEGA_APPLICATION','~',SRC.PG_BIA_RATING_FOR_INTEGRITY)=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id)
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.PG_BIA_RATING_FOR_INTEGRITY IS NULL THEN 0 ELSE -1 END)<>TRGT.pg_bia_rating_for_integrity_c_key
AND SRC.cdctype<>'D'
) temp;