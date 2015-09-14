

SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message 
FROM <<tenant>>_mdsdb.cmdb_ci_final S
left join d_domain DMN
on (DMN.row_id = S.sys_domain 
and DMN.source_id = (case when S.sys_domain is null then 0 else S.sourceinstance end) )

where concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(DMN.row_key,'-1'))not in (
select concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.domain_key,'')) from <<tenant>>_mdwdb.d_configuration_item DWH);
