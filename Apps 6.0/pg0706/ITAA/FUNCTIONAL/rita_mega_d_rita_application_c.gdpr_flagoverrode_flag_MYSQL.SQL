SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.gdpr_flagoverrode_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN 
(SELECT APP_HEXID,sourceinstance,GROUP_CONCAT(KEYWORD_NAME) AS KEYWORD_NAME,cdctype FROM 
png_mdsdb.pg_mega_pgb_app_keyword_final where cdctype='X'
group by 1,2)SRC1 ON SRC.NAME=SRC1.APP_HEXID AND SRC.sourceinstance=SRC1.sourceinstance 
LEFT JOIN  png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(CASE WHEN (SRC1.KEYWORD_NAME like '%GDPR - Relevance: No%') OR (SRC1.KEYWORD_NAME like '%GDPR - Relevance: Yes%') THEN 'Y' ELSE 'N' END)
<>TRGT.gdpr_flagoverrode_flag
AND SRC.cdctype='X'
) temp;


