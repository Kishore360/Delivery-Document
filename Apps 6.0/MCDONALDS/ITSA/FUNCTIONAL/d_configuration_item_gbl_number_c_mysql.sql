
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.gbl_number_c' ELSE 'SUCCESS' END as MESSAGE
FROM 
(
SELECT count(1) as cnt  from
mcd_mdsdb.cmdb_ci_final b 
 join mcd_mdsdb.u_cmdb_ci_application_component_final c  on c.sourceinstance = b.sourceinstance and b.sys_id = c.sys_id  and c.cdctype<>'D' and b.cdctype<>'D' 
 JOIN  mcd_mdsdb.u_gbl_final  d on b.sourceinstance = d.sourceinstance and c.u_application_gbl = d.sys_id  and d.cdctype<>'D'
join mcd_mdwdb.d_configuration_item a on b.sys_id=a.row_id and b.sourceinstance=a.source_id
 join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = c.sourceinstance)
and (c.cdctime<=f1.lastupdated) and  gbl_number_c <> d.u_gbl
)a;

