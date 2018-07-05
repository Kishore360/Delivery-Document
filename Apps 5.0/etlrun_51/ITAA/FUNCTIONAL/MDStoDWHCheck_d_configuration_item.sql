
SELECT case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed between cmdb_ci_final and d_configuration_item' else 'SUCCESS' end as Message
FROM wow_mdsdb.cmdb_ci_final S
left join wow_mdsdb.cmn_department_final CDF
on ((CDF.sys_id ) = (S.department ))
left join wow_mdsdb.cmn_location_final CLF
on ((CLF.sys_id ) = (S.location ))
left join wow_mdsdb.core_company_final CCF
on ((CCF.sys_id ) = (S.company ))
left join wow_mdsdb.sys_user_group_final SYG
on ((SYG.sys_id ) = (S.support_group ))
left join wow_mdsdb.core_company_final CCF_VEN
on ((CCF_VEN.sys_id ) = (S.vendor ))
left join wow_mdsdb.core_company_final CCF_COM
on ((CCF_COM.sys_id ) = (S.company ))
left join wow_mdwdb.d_domain DMN
on ((DMN.row_id ) = (S.sys_domain )
and (DMN.source_id ) = ((case when S.sys_domain is null then 0 else S.sourceinstance end) ))
left join wow_mdwdb.d_internal_organization DIO_C
on ((DIO_C.row_id ) = (concat('SUBSIDIARY~',S.company) )
and (DIO_C.source_id ) = ((case when S.company is null then 0 else S.sourceinstance end) ))
where CRC32((concat(
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
ifnull(CONVERT_TZ(S.sys_created_on,'GMT','MST'),''),
ifnull(CONVERT_TZ(S.sys_updated_on,'GMT','MST'),''),
ifnull(CCF_COM.name,''),
ifnull(DIO_C.row_key, case when S.company is null then 0 else -1 end),
ifnull(DMN.row_key, case when S.sys_domain is null then 0 else -1 end))
)) not in (
select CRC32((concat(
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
)) from wow_mdwdb.d_configuration_item DWH);