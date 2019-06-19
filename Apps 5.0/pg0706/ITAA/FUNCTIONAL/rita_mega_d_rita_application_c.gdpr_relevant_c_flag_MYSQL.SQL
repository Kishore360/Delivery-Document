SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.gdpr_relevant_c_flag' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN 
(SELECT a.APP_HEXID,a.sourceinstance,GROUP_CONCAT(DISTINCT a.KEYWORD_NAME ORDER BY KEYWORD_NAME) AS KEYWORD_NAME  FROM
png_mdsdb.pg_mega_pgb_app_keyword_final a WHERE a.cdctype='X'
GROUP BY 1) SRC1 ON SRC.NAME=SRC1.APP_HEXID AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN  png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(CASE WHEN SRC1.KEYWORD_NAME like '%ITAM: GDPR - Relevance: No%' THEN 'N'
WHEN SRC1.KEYWORD_NAME like '%ITAM: GDPR - Relevance: Yes%' THEN 'Y' ELSE 
IF ((SRC.VOLUME_OF_RECORDS_EU) = '0' OR (SRC.VOLUME_OF_RECORDS_EU) IS NULL OR ((SRC.VOLUME_OF_RECORDS_EU) = '' ),'N','Y')
 END)<>TRGT.gdpr_relevant_c_flag
AND SRC.cdctype='X'
) temp;




