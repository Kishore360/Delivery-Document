


SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message; 
select S.sys_id FROM <<tenant>>_mdsdb.cmdb_ci_final S
join app_test.lsm_ls_source_timezone L
on (convert(S.sourceinstance using utf8) = convert(L.sourceid using utf8))

left join <<tenant>>_mdsdb.sys_user_final SYF
on (convert(SYF.sys_id using utf8) = convert(S.assigned_to using utf8))

left join <<tenant>>_mdsdb.cmn_department_final CDF
on (convert(CDF.sys_id using utf8) = convert(S.department using utf8))

left join <<tenant>>_mdsdb.cmn_location_final CLF
on (convert(CLF.sys_id using utf8) = convert(S.location using utf8))

left join <<tenant>>_mdsdb.sys_user_final SYF_MAN
on(convert(SYF_MAN.sys_id using utf8) = convert(S.managed_by using utf8))

left join <<tenant>>_mdsdb.core_company_final CCF
on (convert(CCF.sys_id using utf8) = convert(S.company using utf8))

left join <<tenant>>_mdsdb.sys_user_final SYF_OWN
on (convert(SYF_OWN.sys_id using utf8) = convert(S.owned_by using utf8))

left join <<tenant>>_mdsdb.sys_user_group_final SYG
on (convert(SYG.sys_id using utf8) = convert(S.support_group using utf8))

left join <<tenant>>_mdsdb.core_company_final CCF_VEN
on (convert(CCF_VEN.sys_id using utf8) = convert(S.vendor using utf8))

left join <<tenant>>_mdsdb.sys_user_final SYF_SUP
on (convert(SYF_SUP.sys_id using utf8) = convert(S.supported_by using utf8))

left join <<tenant>>_mdsdb.core_company_final CCF_COM
on (convert(CCF_COM.sys_id using utf8) = convert(S.company using utf8))

left join d_domain DMN
on (convert(DMN.row_id using utf8) = convert(S.sys_domain using utf8)
and convert(DMN.source_id using utf8) = convert((case when S.sys_domain is null then 0 else S.sourceinstance end) using utf8))

left join d_internal_organization DIO_C
on (convert(DIO_C.row_id using utf8) = convert(S.company using utf8)
and convert(DIO_C.source_id using utf8) = convert((case when S.company is null then 0 else S.sourceinstance end) using utf8)) 

where CRC32(convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(S.asset_tag,''),
ifnull(concat(concat(SYF.first_name,' '),SYF.last_name),''),
ifnull(S.category,''),
ifnull(CDF.name,''),
ifnull(S.lease_id,''),
ifnull(CLF.name,''),
ifnull(concat(concat(SYF_MAN.first_name,' '),SYF.last_name),''),
ifnull(CCF.name,''),
ifnull(S.model_id,''),
ifnull(S.name,''),
ifnull(concat(concat(SYF_OWN.first_name,' '),SYF.last_name),''),
ifnull(S.subcategory,''),
ifnull(SYG.name,''),
ifnull(S.sys_class_name,''),
ifnull(CCF_VEN.name,''),
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),''),
ifnull(concat(concat(SYF_SUP.first_name,' '),SYF.last_name),''),
ifnull(CCF_COM.name,''),
ifnull(DIO_C.row_key,'-1'),
ifnull(DMN.row_key,'-1'))
using utf8)) not in (
select CRC32(convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.asset_tag,''),
ifnull(DWH.assigned_to,''),
ifnull(DWH.category,''),
ifnull(DWH.department,''),
ifnull(DWH.lease_contract,''),
ifnull(DWH.location,''),
ifnull(DWH.managed_by,''),
ifnull(DWH.manufacturer,''),
ifnull(DWH.model_number,''),
ifnull(DWH.name,''),
ifnull(DWH.owned_by,''),
ifnull(DWH.subcategory,''),
ifnull(DWH.support_group,''),
ifnull(DWH.class,''),
ifnull(DWH.vendor,''),
ifnull(DWH.created_by,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.changed_on,''),
ifnull(DWH.supported_by,''),
ifnull(DWH.company,''),
ifnull(DWH.company_key,''),
ifnull(DWH.domain_key,''))
using utf8)) from <<tenant>>_mdwdb.d_configuration_item DWH);
