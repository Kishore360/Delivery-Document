select 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.platform_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
png_mdsdb.cmdb_ci_final SRC
join png_mdwdb.d_configuration_item_ext_c TRGT ON SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join(select b.child,b.sourceinstance,group_concat(distinct d.name separator ' , ') as platform
from png_mdsdb.cmdb_ci_hardware_final a
join png_mdsdb.cmdb_rel_ci_final b on a.sys_id=b.child and a.sourceinstance=b.sourceinstance 
join png_mdsdb.cmdb_rel_type_final c on b.type=c.sys_id and c.sourceinstance=b.sourceinstance 
AND c.name='Runs on::Runs' 
join png_mdsdb.cmdb_ci_final d on b.parent=d.sys_id and b.sourceinstance=d.sourceinstance
join png_mdsdb.cmdb_ci_appl_final e on d.sys_id=e.sys_id and d.sourceinstance=e.sourceinstance
where a.cdctype<>'D' and e.u_pg_category='application_platform'
group by b.child, b.sourceinstance
) LKP ON SRC.sys_id=LKP.child AND SRC.sourceinstance=LKP.sourceinstance
WHERE COALESCE(LKP.platform,'UNSPECIFIED') <> TRGT.platform_c
)temp;


 