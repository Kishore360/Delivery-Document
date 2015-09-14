

SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message
FROM <<tenant>>_mdsdb.cmdb_ci_final S

left join <<tenant>>_mdsdb.sys_user_final SYF
on (SYF.sys_id = S.assigned_to )

left join <<tenant>>_mdsdb.sys_user_final SYF_OWN
on (SYF_OWN.sys_id = S.owned_by )

where concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(concat(concat(SYF_OWN.first_name,' '),SYF.last_name),'') )not in (
select concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.owned_by,'') ) from <<tenant>>_mdwdb.d_configuration_item DWH);
