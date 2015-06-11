

SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message 
FROM <<tenant>>_mdsdb.cmdb_ci_final S
left join d_domain DMN
on (convert(DMN.row_id using utf8) = convert(S.sys_domain using utf8)
and convert(DMN.source_id using utf8) = convert((case when S.sys_domain is null then 0 else S.sourceinstance end) )using utf8)

where convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(DMN.row_key,'-1')using utf8))not in (
select convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.domain_key,'')using utf8)) from <<tenant>>_mdwdb.d_configuration_item DWH);
