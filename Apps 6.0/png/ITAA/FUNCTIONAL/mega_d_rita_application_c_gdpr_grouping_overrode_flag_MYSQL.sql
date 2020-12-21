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
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.gdpr_grouping_overrode_flag' ELSE 'SUCCESS' END as Message
FROM 
(select count(1) as CNT
from
(select app_hexid ,KEYWORD_ID, sourceinstance
from
png_mdsdb.pg_mega_pgb_app_keyword_final where app_hexid  is not null and KEYWORD_ID is not null and  KEYWORD_ID<>'' and cdctype='X' 
and keyword_name IN('ITAM: GDPR - Grouping: 1','ITAM: GDPR - Grouping: 2','ITAM: GDPR - Grouping: 3','ITAM: GDPR - Grouping: 4')) a
join png_mdsdb.pg_mega_cmdb_ci_appl_final b
on (a.app_hexid=b.u_pg_source_system_id and a.sourceinstance=b.sourceinstance)
join png_mdwdb.d_rita_application_c c
on c.row_id = b.sys_id and c.source_id = b.sourceinstance
where c.gdpr_grouping_overrode_flag=CASE WHEN a.app_hexid IS NOT NULL THEN 'Y' ELSE 'N' END
)temp;

