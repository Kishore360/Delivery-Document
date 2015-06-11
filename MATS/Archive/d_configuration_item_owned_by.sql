

SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message
FROM #MDS_TABLE_SCHEMA.cmdb_ci_final S

left join #MDS_TABLE_SCHEMA.sys_user_final SYF
on (convert(SYF.sys_id using utf8) = convert(S.assigned_to using utf8))

left join #MDS_TABLE_SCHEMA.sys_user_final SYF_OWN
on (convert(SYF_OWN.sys_id using utf8) = convert(S.owned_by using utf8))

where convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(concat(concat(SYF_OWN.first_name,' '),SYF.last_name),'') )using utf8)not in (
select convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.owned_by,'') )using utf8) from #TABLE_SCHEMA.d_configuration_item DWH);
