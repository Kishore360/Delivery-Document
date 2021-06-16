

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.vendors_privacyinfosec_updated' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN  png_mdwdb.d_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
join png_mdsdb.pg_mega_pgb_application_rita_final pgb_application_rita
on SRC.u_pg_source_system_id=pgb_application_rita.name and SRC.sourceinstance=pgb_application_rita.sourceinstance
WHERE (IF (pgb_application_rita.VENDORS_PRIVACYINFOSEC_UPDATED IS NOT NULL AND pgb_application_rita.VENDORS_PRIVACYINFOSEC_UPDATED <>'', pgb_application_rita.VENDORS_PRIVACYINFOSEC_UPDATED,'UNSPECIFIED'))<>TRGT.vendors_privacyinfosec_updated
AND SRC.cdctype='X' and pgb_application_rita.cdctype='X'
) temp;



