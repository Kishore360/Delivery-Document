SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.mega_hex' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN png_mdsdb.pg_mega_pgv_app_responsible_org_person_final SRC1 ON SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype='X'
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.u_pg_source_system_id ,'UNSPECIFIED')<>TRGT.mega_hex AND SRC.cdctype='X'
) temp;





 