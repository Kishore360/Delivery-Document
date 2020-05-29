select tp.name , tpv.t_value , ui.label from #TENANT_NAME.srcmm_property tp
join #TENANT_NAME.srcmm_tenantpropertyvalue tpv
on tp.srcmm_property_parent_id = tpv.srcmm_tenantpropertyvalue_property
join #TENANT_NAME.srcmm_propertyuimetadata ui
on ui.srcmm_propertyuimetadata_property = tp.srcmm_property_parent_id
where tp.propertycategory = 'TenantApplication'
and groupname in ('Application Setup' ,'Email','Currency','Calendar')
and label not in ('Tenant Email Receiver TO List' , 'Email Sender Display Name' ,'Tenant Email Receiver CC List','Tenant Email Receiver BCC List',
'Login Username for Email' ,'Email Password')
order by lower(name), lower(label) asc