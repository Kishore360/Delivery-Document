select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed between cmdb_ci_final and d_configuration_item' else 'SUCCESS' end as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_final WHERE CDCTYPE<>'D') S

-- left join ( SELECT * FROM #MDS_TABLE_SCHEMA.cmn_department_final WHERE CDCTYPE<>'D') CDF
-- on (CDF.sys_id  = S.department )

left join ( SELECT * FROM #MDS_TABLE_SCHEMA.cmn_location_final WHERE CDCTYPE<>'D') CLF
on (CLF.sys_id  = S.location )

left join ( SELECT * FROM #MDS_TABLE_SCHEMA.core_company_final WHERE CDCTYPE<>'D') CCF
on (CCF.sys_id  = S.manufacturer )

-- left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_user_group_final WHERE CDCTYPE<>'D') SYG
-- on (SYG.sys_id  = S.support_group )

left join ( SELECT * FROM #MDS_TABLE_SCHEMA.core_company_final WHERE CDCTYPE<>'D') CCF_VEN
on (CCF_VEN.sys_id  = S.vendor )

-- left join ( SELECT * FROM #MDS_TABLE_SCHEMA.core_company_final WHERE CDCTYPE<>'D') CCF_COM
-- on (CCF_COM.sys_id  = S.company )

LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_db_object_final WHERE CDCTYPE<>'D') sdof 
ON S.sys_class_name=sdof.name and S.sourceinstance=sdof.sourceinstance

left join #DWH_TABLE_SCHEMA.d_domain DMN
on (DMN.row_id  = S.sys_domain 
and DMN.source_id  = (case when S.sys_domain is null then 0 else S.sourceinstance end) )

left join #DWH_TABLE_SCHEMA.d_internal_organization DIO_C
on (DIO_C.row_id  = concat('SUBSIDIARY~',S.company) 
and DIO_C.source_id  = (case when S.company is null then 0 else S.sourceinstance end) ) 

where CRC32(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(S.asset_tag,''),
ifnull(S.category,'UNSPECIFIED'),
-- ifnull(CDF.name,''),
ifnull(S.lease_id,''),
ifnull(CCF.name,''),
ifnull(S.model_number,''),
ifnull(S.name,''),
ifnull(S.subcategory,''),
-- ifnull(SYG.name,''),
ifnull(sdof.label,''),
coalesce(CCF_VEN.name,S.vendor,''),
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
ifnull(convert_tz(S.sys_updated_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
-- ifnull(CCF_COM.name,''),
ifnull(DIO_C.row_key, case when S.company is null then 0 else -1 end),
ifnull(DMN.row_key, case when S.sys_domain is null then 0 else -1 end))
) not in (
select CRC32(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.asset_tag,''),
ifnull(DWH.category,''),
-- ifnull(DWH.department,''),
ifnull(DWH.lease_contract,''),
ifnull(DWH.manufacturer,''),
ifnull(DWH.model_number,''),
ifnull(DWH.name,''),
ifnull(DWH.subcategory,''),
-- ifnull(DWH.support_group,''),
ifnull(DWH.class,''),
ifnull(DWH.vendor,''),
ifnull(DWH.created_by,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.changed_on,''),
-- ifnull(DWH.company,''),
ifnull(DWH.company_key,''),
ifnull(DWH.domain_key,''))
) from #DWH_TABLE_SCHEMA.d_configuration_item DWH);
