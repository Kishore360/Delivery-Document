

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.pg_csa_last_peformed' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
join png_mdsdb.pg_mega_pgb_application_rita_final pgb_application_rita
on SRC.u_pg_source_system_id=pgb_application_rita.name and SRC.sourceinstance=pgb_application_rita.sourceinstance
LEFT JOIN  png_mdwdb.d_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE DATE_FORMAT(SUBSTRING(REPLACE(pgb_application_rita.PG_CSA_LAST_PEFORMED,' ',''),1,14),'%Y-%m-%d %h:%i:%s')<>TRGT.pg_csa_last_peformed
and SRC.cdctype='X' and pgb_application_rita.cdctype='X'
) temp;


