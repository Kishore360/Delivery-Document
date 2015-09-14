


SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message; 
select S.sys_id FROM <<tenant>>_mdsdb.cmdb_ci_final S
join app_test.lsm_ls_source_timezone L
on (S.sourceinstance = L.sourceid )

left join <<tenant>>_mdsdb.sys_user_final SYF
on (SYF.sys_id = S.assigned_to )

left join <<tenant>>_mdsdb.cmn_department_final CDF
on (CDF.sys_id = S.department )

left join <<tenant>>_mdsdb.cmn_location_final CLF
on (CLF.sys_id = S.location )

left join <<tenant>>_mdsdb.sys_user_final SYF_MAN
on(SYF_MAN.sys_id = S.managed_by )

left join <<tenant>>_mdsdb.core_company_final CCF
on (CCF.sys_id = S.company )

left join <<tenant>>_mdsdb.sys_user_final SYF_OWN
on (SYF_OWN.sys_id = S.owned_by )

left join <<tenant>>_mdsdb.sys_user_group_final SYG
on (SYG.sys_id = S.support_group )

left join <<tenant>>_mdsdb.core_company_final CCF_VEN
on (CCF_VEN.sys_id = S.vendor )

left join <<tenant>>_mdsdb.sys_user_final SYF_SUP
on (SYF_SUP.sys_id = S.supported_by )

left join <<tenant>>_mdsdb.core_company_final CCF_COM
on (CCF_COM.sys_id = S.company )

left join d_domain DMN
on (DMN.row_id = S.sys_domain 
and DMN.source_id = (case when S.sys_domain is null then 0 else S.sourceinstance end) )

left join d_internal_organization DIO_C
on (DIO_C.row_id = S.company 
and DIO_C.source_id = (case when S.company is null then 0 else S.sourceinstance end) ) 

where CRC32(concat(
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
) not in (
select CRC32(concat(
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
) from <<tenant>>_mdwdb.d_configuration_item DWH);
