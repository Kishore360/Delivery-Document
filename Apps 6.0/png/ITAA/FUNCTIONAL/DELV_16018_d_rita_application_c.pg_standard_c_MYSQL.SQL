

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.pg_standard_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE (case when SRC.U_PG_STANDARD='yes' then 'Y' when SRC.U_PG_STANDARD='no' then 'N' else 'UNSPECIFIED' end)<>TRGT.pg_standard_c
AND SRC.cdctype<>'D'
) temp;



