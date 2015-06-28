SELECT  CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message from (
select count(1) cnt from (
select fgh.cde,t.abc from (
select s.sys_id sys_id ,s.sourceinstance sourceinstance,concat(coalesce(s.sys_id,''),coalesce(s.sourceinstance,''),coalesce(CDF.name,'') ) as abc FROM uclahealth_mdsdb.cmdb_ci_final s 
 join uclahealth_mdsdb.cmn_department_final CDF
on (CDF.sys_id  = department ))t
join
(select DWH.row_id row_id,DWH.source_id source_id, (concat(coalesce(DWH.row_id,''),coalesce(DWH.source_id,''),coalesce(DWH.department,'') )) cde 
from uclahealth_mdwdb.d_configuration_item DWH)fgh
on fgh.row_id=t.sys_id
and fgh.source_id=t.sourceinstance
and fgh.cde<>t.abc)a)h;