SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.keyword_subject_area_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN 
(Select APP_HEXID,sourceinstance,GROUP_CONCAT(DISTINCT KEYWORD_NAME ORDER BY KEYWORD_ID) AS Keyword_Subject_Area 
FROM png_mdsdb.pg_mega_pgb_app_keyword_final where APP_HEXID IS NOT NULL AND KEYWORD_ID IS NOT NULL and KEYWORD_ID<>'' AND cdctype<>'D'
group by 1,2) SRC1 ON SRC.NAME=SRC1.APP_HEXID AND SRC.sourceinstance=SRC1.sourceinstance 
LEFT JOIN  png_mdwdb.d_rita_application_ext_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.Keyword_Subject_Area,'UNSPECIFIED')<>TRGT.keyword_subject_area_c
AND SRC.cdctype<>'D'
) temp;




  

