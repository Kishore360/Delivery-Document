

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.data_retention_def_implemented' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
join png_mdsdb.pg_mega_pgb_application_rita_final pgb_application_rita
on SRC.u_pg_source_system_id=pgb_application_rita.name and SRC.sourceinstance=pgb_application_rita.sourceinstance
LEFT JOIN  png_mdwdb.d_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE (IF(pgb_application_rita.DATA_RETENTION_DEF_IMPLEMENTED IS NOT NULL AND pgb_application_rita.DATA_RETENTION_DEF_IMPLEMENTED <>'', pgb_application_rita.DATA_RETENTION_DEF_IMPLEMENTED,'UNSPECIFIED'))<>TRGT.data_retention_def_implemented
and SRC.cdctype='X' and pgb_application_rita.cdctype='X'
) temp;



