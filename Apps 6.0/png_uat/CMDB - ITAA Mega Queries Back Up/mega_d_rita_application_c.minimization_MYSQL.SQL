SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.minimization' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN png_mdsdb.pg_mega_pgb_application_rita_final SRC1 ON SRC.u_pg_source_system_id=SRC1.NAME AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype='X'
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC1.NAME=TRGT.row_id AND SRC1.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.MINIMIZATION,'UNSPECIFIED')<>TRGT.minimization
AND SRC.cdctype='X'
) temp;



