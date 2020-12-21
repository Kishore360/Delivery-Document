/* SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.gdpr_grouping_overrode_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN png_mdsdb.pg_mega_pgb_app_keyword_final SRC1 ON SRC.NAME=SRC1.APP_HEXID AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE (CASE WHEN SRC1.KEYWORD_NAME IN ('ITAM: GDPR - Relevance: No','ITAM: GDPR - Relevance: Yes') THEN 'Y'
ELSE 'N' END)<>TRGT.gdpr_grouping_overrode_flag
AND SRC.cdctype<>'D'  AND SRC1.cdctype<>'D' 
) temp;
 */

SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.gdpr_grouping_overrode_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT a12.app_hexid,a12.sourceinstance,group_concat(a12.keyword_name ) as keyword_name
from png_mdsdb.pg_mega_pgb_app_keyword_final a12 where a12.keyword_name IN('ITAM: GDPR - Grouping: 1','ITAM: GDPR - Grouping: 2','ITAM: GDPR - Grouping: 3','ITAM: GDPR - Grouping: 4')
and a12.cdctype = 'X'
GROUP BY 1,2
) src
LEFT JOIN png_mdwdb.d_rita_application_c TRGT
ON TRGT.row_id = src.app_hexid and TRGT.source_id = src.sourceinstance
where TRGT.gdpr_grouping_overrode_flag <> CASE WHEN src.app_hexid IS NOT NULL THEN 'Y' ELSE 'N' END
and TRGT.soft_deleted_flag ='N'
