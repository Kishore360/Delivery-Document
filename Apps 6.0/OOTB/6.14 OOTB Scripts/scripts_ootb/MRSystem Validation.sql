select tp.name , tpv.t_value , ui.label  from #TENANT_NAME.srcmm_property tp
join #TENANT_NAME.srcmm_tenantpropertyvalue tpv
on tp.srcmm_property_parent_id = tpv.srcmm_tenantpropertyvalue_property
join #TENANT_NAME.srcmm_propertyuimetadata ui
on ui.srcmm_propertyuimetadata_property = tp.srcmm_property_parent_id
 where tp.propertycategory = 'TenantSystem'
and groupname not in  ('Foreign Keys')
and groupname in ('DW & ETL configuration' ,'MySQL Connections','OOTB','S3 Bucket Configuration','Redshift DW Connection')
order by lower(name), lower(label) 