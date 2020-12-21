

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.pg_bia_confidentiality_rating_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN png_mdwdb.d_lov LKP ON (CONCAT('CONFIDENTIALITY_RATING','~','MEGA_APPLICATION','~',SRC.u_pg_bia_rating_for_confidentiality)=LKP.row_id AND 
SRC.sourceinstance=LKP.source_id)
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_pg_bia_rating_for_confidentiality IS NULL THEN 0 ELSE -1 END)<>TRGT.pg_bia_confidentiality_rating_c_key
AND SRC.cdctype<>'D'
) temp;


