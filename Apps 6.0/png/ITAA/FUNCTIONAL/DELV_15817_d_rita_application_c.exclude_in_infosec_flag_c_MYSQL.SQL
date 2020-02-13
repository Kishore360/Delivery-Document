SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.exclude_in_infosec_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT 
Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC
LEFT JOIN 
(
Select a.APP_HEXID,a.sourceinstance,GROUP_CONCAT(a.KEYWORD_NAME) AS KEYWORD_NAME
FROM png_mdsdb.pg_mega_pgb_app_keyword_final a WHERE a.cdctype='X'
GROUP BY 1,2
) SRC1 ON SRC.u_pg_source_system_id=SRC1.APP_HEXID AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(CASE WHEN SRC1.APP_HEXID IS NOT NULL AND (SRC1.KEYWORD_NAME like '%ITAM: GDPR - Report Exclusion: Infosec%') THEN 'Y' ELSE 'N' END)
<>TRGT.exclude_in_infosec_flag_c
AND SRC.cdctype='X'
) temp;



 