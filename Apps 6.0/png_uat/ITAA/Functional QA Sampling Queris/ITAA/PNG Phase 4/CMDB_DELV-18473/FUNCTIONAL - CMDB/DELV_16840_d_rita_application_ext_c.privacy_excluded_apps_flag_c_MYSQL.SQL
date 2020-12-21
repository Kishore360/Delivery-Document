SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.privacy_excluded_apps_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT 
Count(1) as CNT 
FROM png_mdwdb.d_rita_application_ext_c a
join (select megaid, sourceinstance from png_mdsdb.pg_mega_privacy_excluded_apps_c_final where cdctype='X') b
on (a.mega_id_c=b.megaid and a.source_id=b.sourceinstance)
join 
png_mdsdb.pg_mega_cmdb_ci_appl_final c
on (a.row_id=c.sys_id and a.source_id=c.sourceinstance)
where (case when b.megaid is not null then 'Y' else 'N' end)= a.privacy_excluded_apps_flag_c
) temp;
	 