SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_application.u_pg_category_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.cmdb_ci_appl_final SRC
JOIN png_mdwdb.d_application TRGT
ON CONCAT('APPLICATION~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE COALESCE(u_pg_category,'UNSPECIFIED')<>TRGT.u_pg_category_c 
) temp;


