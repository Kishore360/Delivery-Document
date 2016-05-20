SELECT case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed between cmdb_ci_final and d_configuration_item' else 'SUCCESS' end as Message

FROM #MDS_TABLE_SCHEMA.cmdb_ci_final S
join app_test.lsm_ls_source_timezone L
on (convert(S.sourceinstance using utf8) = convert(L.sourceid using utf8))

left join #MDS_TABLE_SCHEMA.cmn_department_final CDF
on (convert(CDF.sys_id using utf8) = convert(S.department using utf8))


left join #MDS_TABLE_SCHEMA.cmn_location_final CLF
on (convert(CLF.sys_id using utf8) = convert(S.location using utf8))

left join #MDS_TABLE_SCHEMA.core_company_final CCF
on (convert(CCF.sys_id using utf8) = convert(S.company using utf8))

left join #MDS_TABLE_SCHEMA.sys_user_group_final SYG
on (convert(SYG.sys_id using utf8) = convert(S.support_group using utf8))

left join #MDS_TABLE_SCHEMA.core_company_final CCF_VEN
on (convert(CCF_VEN.sys_id using utf8) = convert(S.vendor using utf8))

left join #MDS_TABLE_SCHEMA.core_company_final CCF_COM
on (convert(CCF_COM.sys_id using utf8) = convert(S.company using utf8))

left join #DWH_TABLE_SCHEMA.d_domain DMN
on (convert(DMN.row_id using utf8) = convert(S.sys_domain using utf8)
and convert(DMN.source_id using utf8) = convert((case when S.sys_domain is null then 0 else S.sourceinstance end) using utf8))

left join #DWH_TABLE_SCHEMA.d_internal_organization DIO_C
on (convert(DIO_C.row_id using utf8) = convert(concat('SUBSIDIARY~',S.company) using utf8)
and convert(DIO_C.source_id using utf8) = convert((case when S.company is null then 0 else S.sourceinstance end) using utf8)) 



where CRC32(convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(S.asset_tag,''),
ifnull(S.category,''),
ifnull(CDF.name,''),
ifnull(S.lease_id,''),
ifnull(CLF.name,''),
ifnull(CCF.name,''),
ifnull(S.model_number,''),
ifnull(S.name,''),
ifnull(S.subcategory,''),
ifnull(SYG.name,''),
ifnull(S.sys_class_name,''),
coalesce(CCF_VEN.name,S.vendor,''),
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),''),
ifnull(CCF_COM.name,''),
ifnull(DIO_C.row_key, case when S.company is null then 0 else -1 end),
ifnull(DMN.row_key, case when S.sys_domain is null then 0 else -1 end))
using utf8)) not in (
select CRC32(convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.asset_tag,''),
ifnull(DWH.category,''),
ifnull(DWH.department,''),
ifnull(DWH.lease_contract,''),
ifnull(DWH.location,''),
ifnull(DWH.manufacturer,''),
ifnull(DWH.model_number,''),
 ifnull(DWH.name,''),
ifnull(DWH.subcategory,''),
ifnull(DWH.support_group,''),
ifnull(DWH.class,''),
ifnull(DWH.vendor,''),
ifnull(DWH.created_by,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.changed_on,''),
ifnull(DWH.company,''),
ifnull(DWH.company_key,''),
ifnull(DWH.domain_key,''))
using utf8)) from #DWH_TABLE_SCHEMA.d_configuration_item DWH);
