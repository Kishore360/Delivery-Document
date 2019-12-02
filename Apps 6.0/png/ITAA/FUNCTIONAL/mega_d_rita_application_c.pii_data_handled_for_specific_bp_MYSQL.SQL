-- If Failed might be Sequencing Ordering issues 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.pii_handled_for_specific_bp' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
png_mdsdb.pg_mega_cmdb_ci_appl_final a
join 
(select app_hexid,sourceinstance,group_concat(distinct pii_handled_for_specific_bp) as pii_handled_for_specific_bp  from 
png_mdsdb.pg_mega_pgv_app_responsible_org_person_final
where app_hexid is not null and pii_handled_for_specific_bp is not null and cdctype='X'
 group by 1,2) b
on (a.u_pg_source_system_id=b.app_hexid and a.sourceinstance=b.sourceinstance)
join png_mdwdb.d_rita_application_c c
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
where COALESCE(b.pii_handled_for_specific_bp,'UNSPECIFIED')<>c.pii_data_handled_for_specific_bp
and a.cdctype='X'
) temp;



