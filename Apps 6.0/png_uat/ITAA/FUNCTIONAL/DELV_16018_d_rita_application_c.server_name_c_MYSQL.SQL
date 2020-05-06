
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.server_name_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN 
(
SELECT correlation_id,sourceinstance,GROUP_CONCAT(distinct name ORDER BY 1) AS SERVER_NAME
FROM png_mdsdb.pg_mega_cmdb_ci_computer_final where correlation_id IS NOT NULL and cdctype='X'
group by 1,2
) SRC1 ON SRC.correlation_id=SRC1.correlation_id AND SRC.sourceinstance=SRC1.sourceinstance 
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.SERVER_NAME,'UNSPECIFIED')<>TRGT.server_name_c
AND SRC.cdctype='X'
) temp;




