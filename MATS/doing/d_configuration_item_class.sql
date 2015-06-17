

SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message
FROM <<tenant>>_mdsdb.cmdb_ci_final S

where convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(S.sys_class_name,'') )using utf8)not in (
select convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.class,'') )using utf8) from <<tenant>>_mdwdb.d_configuration_item DWH);
