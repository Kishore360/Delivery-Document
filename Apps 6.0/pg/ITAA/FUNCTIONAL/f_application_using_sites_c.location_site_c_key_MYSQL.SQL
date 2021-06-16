SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_application_using_sites_c.location_site_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
png_mdsdb.pg_mega_u_cmdb_ci_appl_instance_final SRC 
LEFT JOIN 
(
SELECT substring_index(substring_index(u_pg_using_site, ',', n), ',', -1) as site_id,sys_id 
FROM png_mdsdb.pg_mega_u_cmdb_ci_appl_instance_final 
JOIN 
 (
SELECT a.N + b.N * 10 + 1 as n
FROM
(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b 
   ORDER BY n
 ) numbers
 ON char_length(u_pg_using_site) - char_length(replace(u_pg_using_site, ',', '')) >= n - 1
) SRC1  ON SRC.sys_id=SRC1.sys_id
LEFT JOIN png_mdwdb.f_application_using_sites_c TRGT ON 
CONCAT(COALESCE(SRC.sys_id,'UNSPECIFIED'),'~',COALESCE(SRC.u_pg_instance_of,'UNSPECIFIED'),'~',COALESCE(site_id ,'UNSPECIFIED'))=TRGT.row_id
AND SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_location LKP ON SRC1.site_id=LKP.row_id 
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.u_pg_using_site IS NULL THEN 0 ELSE -1 END)<>TRGT.location_site_c_key
AND SRC.cdctype='X'
) temp;


