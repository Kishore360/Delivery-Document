

SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message 
FROM <<tenant>>_mdsdb.cmdb_ci_final S
join app_test.lsm_ls_source_timezone L
on (S.sourceinstance = L.sourceid )

where concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),'') )not in (
select concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.created_on,'') ) from <<tenant>>_mdwdb.d_configuration_item DWH);
