SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.privacy_exists_in_legacy_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from png_mdsdb.pg_mega_cmdb_ci_appl_final a
join (select MegaID, sourceinstance from png_mdsdb.pg_mega_privacy_excluded_apps_c_final where cdctype='X') b
on (a.u_pg_source_system_id=b.MegaID and a.sourceinstance=b.sourceinstance)
join png_mdwdb.d_rita_application_ext_c c
on (a.sys_id=c.row_id and a.sourceinstance=c.source_id)
where (case when b.MegaID is not null then 'Y' else 'N' end)=c.privacy_excluded_apps_flag_c
and a.cdctype='X'
) temp;


