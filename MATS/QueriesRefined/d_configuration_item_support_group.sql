

SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message
FROM <<tenant>>_mdsdb.cmdb_ci_final S

left join <<tenant>>_mdsdb.sys_user_group_final SYG
on (SYG.sys_id = S.support_group )

where concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(SYG.name,'') )not in (
select concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.support_group,'') ) from <<tenant>>_mdwdb.d_configuration_item DWH);
