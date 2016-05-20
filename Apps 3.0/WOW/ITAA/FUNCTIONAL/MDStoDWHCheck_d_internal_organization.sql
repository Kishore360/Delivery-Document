select  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization' ELSE 'SUCCESS' END as Message
from app_test.ds_internal_organization SRC
join #DWH_TABLE_SCHEMA.d_internal_organization TRGT
on(SRC.row_id=TRGT.row_id
and SRC.source_id=TRGT.source_id)
JOIN  app_test.lsm_ls_source_timezone L 
ON (convert(SRC.source_id using utf8)  = convert(L.sourceid using utf8))
where convert(concat(coalesce(SRC.row_id,''),coalesce(SRC.source_id,''),coalesce(SRC.parent_row_id,''),coalesce(SRC.organization_name,''),coalesce(SRC.organization_active_flag,''),coalesce(SRC.organization_url,''),coalesce(SRC.
organization_contact_id,''),coalesce(SRC.organization_contact_name,''),coalesce(SRC.address,''),coalesce(SRC.legal_name,''),coalesce(SRC.fax_phone_number,''),coalesce(SRC.subsidary_fiscal_calendar,''),coalesce(SRC.
subsidary_currency_code,''),coalesce(SRC.city_code,''),coalesce(SRC.state_code,''),coalesce(SRC.postal_code,''),coalesce(SRC.country_code,''),coalesce(SRC.continent_code,''),coalesce(SRC.department_flag,''),coalesce(SRC.legal_entity_flag,''),coalesce(SRC.inventory_org_flag,'')
,coalesce(SRC.subsidiary_flag,''),coalesce(SRC.classification_flag,''),coalesce(SRC.group_flag,''),coalesce(SRC.created_by,'')
,coalesce(SRC.changed_by,''),coalesce(convert_tz(SRC.created_on,L.source_time_zone,L.target_time_zone),''),coalesce(convert_tz(SRC.changed_on,L.source_time_zone,L.target_time_zone),'') ) using utf8)
<>  convert(concat(coalesce(TRGT.row_id,''),coalesce(TRGT.source_id,''),coalesce(TRGT.parent_row_id,''),coalesce(TRGT.organization_name,''),coalesce(TRGT.organization_active_flag,''),coalesce(TRGT.organization_url,''),coalesce(TRGT.
organization_contact_id,''),coalesce(TRGT.organization_contact_name,''),coalesce(TRGT.address,''),coalesce(TRGT.legal_name,''),coalesce(TRGT.fax_phone_number,''),coalesce(TRGT.subsidary_fiscal_calendar,''),coalesce(TRGT.
subsidary_currency_code,''),coalesce(TRGT.city_code,''),coalesce(TRGT.state_code,''),coalesce(TRGT.postal_code,''),coalesce(TRGT.country_code,''),coalesce(TRGT.continent_code,''),coalesce(TRGT.department_flag,''),coalesce(TRGT.legal_entity_flag,''),coalesce(TRGT.
inventory_org_flag,''),coalesce(TRGT.subsidiary_flag,''),coalesce(TRGT.classification_flag,''),coalesce(TRGT.group_flag,''),coalesce(TRGT.created_by,''),coalesce(TRGT.changed_by,''),coalesce(TRGT.created_on,''),coalesce(TRGT.changed_on,'')) using utf8);

