

SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message 
FROM <<tenant>>_mdsdb.cmdb_ci_final S

left join <<tenant>>_mdsdb.sys_user_final SYF
on (convert(SYF.sys_id using utf8) = convert(S.assigned_to using utf8))

left join <<tenant>>_mdsdb.sys_user_final SYF_SUP
on (convert(SYF_SUP.sys_id using utf8) = convert(S.supported_by using utf8))

where convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(concat(concat(SYF_SUP.first_name,' '),SYF.last_name),'') )using utf8)not in (
select convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.supported_by,'') )using utf8) from <<tenant>>_mdwdb.d_configuration_item DWH);
