SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_cmdb_activity_c.task_attribute_wh_old_value_key' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT Count(1) AS CNT 
FROM bbandt_mdwdb.f_cmdb_activity_c TRGT   
left join bbandt_mdwdb.d_location old_location on TRGT.task_attribute_wh_old_value = old_location.row_id and TRGT.source_id = old_location.source_id and TRGT.task_attribute_wh_name = 'Location'
left join bbandt_mdwdb.d_location new_location on TRGT.task_attribute_wh_new_value = new_location.row_id and TRGT.source_id = new_location.source_id and TRGT.task_attribute_wh_name = 'Location'
left join bbandt_mdwdb.d_internal_organization old_support_group on TRGT.task_attribute_wh_old_value = old_support_group.row_id and TRGT.source_id = old_support_group.source_id and TRGT.task_attribute_wh_name = 'Support group'
left join bbandt_mdwdb.d_internal_organization new_support_group on TRGT.task_attribute_wh_new_value = new_support_group.row_id and TRGT.source_id = new_support_group.source_id and TRGT.task_attribute_wh_name = 'Support group'
left join bbandt_mdwdb.d_cost_center old_cost_center on TRGT.task_attribute_wh_old_value = old_cost_center.row_id and TRGT.source_id = old_cost_center.source_id and TRGT.task_attribute_wh_name = 'Cost center'
left join bbandt_mdwdb.d_cost_center new_cost_center on TRGT.task_attribute_wh_new_value = new_cost_center.row_id and TRGT.source_id = new_cost_center.source_id and TRGT.task_attribute_wh_name = 'Cost center'
left join bbandt_mdwdb.d_internal_organization old_cpu_manufacturer on TRGT.task_attribute_wh_old_value = old_cpu_manufacturer.row_id and TRGT.source_id = old_cpu_manufacturer.source_id and TRGT.task_attribute_wh_name = 'CPU manufacturer'
left join bbandt_mdwdb.d_internal_organization new_cpu_manufacturer on TRGT.task_attribute_wh_new_value = new_cpu_manufacturer.row_id and TRGT.source_id = new_cpu_manufacturer.source_id and TRGT.task_attribute_wh_name = 'CPU manufacturer'
left join bbandt_mdwdb.d_product_model old_model on TRGT.task_attribute_wh_old_value = old_model.row_id and TRGT.source_id = old_model.source_id and TRGT.task_attribute_wh_name = 'Model'
left join bbandt_mdwdb.d_product_model new_model on TRGT.task_attribute_wh_new_value = new_model.row_id and TRGT.source_id = new_model.source_id and TRGT.task_attribute_wh_name = 'Model'
left join bbandt_mdwdb.d_lov old_install_status on TRGT.task_attribute_wh_old_value = old_install_status.row_id and TRGT.source_id = old_install_status.source_id and (old_install_status.dimension_class = 'INSTALL_STATUS_C~CONFIGURATION_ITEM' or old_install_status.row_key in (0,-1)) and TRGT.task_attribute_wh_name = 'Status(install_status)'
left join bbandt_mdwdb.d_lov new_install_status on TRGT.task_attribute_wh_new_value = new_install_status.row_id and TRGT.source_id = new_install_status.source_id and (new_install_status.dimension_class = 'INSTALL_STATUS_C~CONFIGURATION_ITEM' or new_install_status.row_key in (0,-1))  and TRGT.task_attribute_wh_name = 'Status(install_status)'
left join bbandt_mdwdb.d_lov old_operational_status on TRGT.task_attribute_wh_old_value = old_operational_status.row_id and TRGT.source_id = old_operational_status.source_id and (old_operational_status.dimension_class = 'OPERATIONAL_STATUS_C~CONFIGURATION_ITEM' or old_operational_status.row_key in (0,-1)) and TRGT.task_attribute_wh_name = 'Operational status'
left join bbandt_mdwdb.d_lov new_operational_status on TRGT.task_attribute_wh_new_value = new_operational_status.row_id and TRGT.source_id = new_operational_status.source_id and (new_operational_status.dimension_class = 'OPERATIONAL_STATUS_C~CONFIGURATION_ITEM' or new_operational_status.row_key in (0,-1))  and TRGT.task_attribute_wh_name = 'Operational status'
left join bbandt_mdwdb.d_lov old_environment on TRGT.task_attribute_wh_old_value = old_environment.row_id and TRGT.source_id = old_environment.source_id and (old_environment.dimension_class = 'ENVIRONMENT_C~CONFIGURATION_ITEM' or old_environment.row_key in (0,-1)) and TRGT.task_attribute_wh_name = 'Environment'
left join bbandt_mdwdb.d_lov new_environment on TRGT.task_attribute_wh_new_value = new_environment.row_id and TRGT.source_id = new_environment.source_id and (new_environment.dimension_class = 'ENVIRONMENT_C~CONFIGURATION_ITEM' or new_environment.row_key in (0,-1)) and TRGT.task_attribute_wh_name = 'Environment'
left join bbandt_mdwdb.d_lov old_role on TRGT.task_attribute_wh_old_value = old_role.row_id and TRGT.source_id = old_role.source_id and (old_role.dimension_class = 'ROLE_C~CONFIGURATION_ITEM' or old_role.row_key in (0,-1)) and TRGT.task_attribute_wh_name = 'Role'
left join bbandt_mdwdb.d_lov new_role on TRGT.task_attribute_wh_new_value = new_role.row_id and TRGT.source_id = new_role.source_id and (new_role.dimension_class = 'ROLE_C~CONFIGURATION_ITEM' or new_role.row_key in (0,-1))  and TRGT.task_attribute_wh_name = 'Role'
left join bbandt_mdwdb.d_lov old_tier_rating on TRGT.task_attribute_wh_old_value = old_tier_rating.row_id and TRGT.source_id = old_tier_rating.source_id and (old_tier_rating.dimension_class = 'TIER_RATING_C~CONFIGURATION_ITEM' or old_tier_rating.row_key in (0,-1))  and TRGT.task_attribute_wh_name = 'Tier rating'
left join bbandt_mdwdb.d_lov new_tier_rating on TRGT.task_attribute_wh_new_value = new_tier_rating.row_id and TRGT.source_id = new_tier_rating.source_id and (new_tier_rating.dimension_class = 'TIER_RATING_C~CONFIGURATION_ITEM' or new_tier_rating.row_key in (0,-1)) and TRGT.task_attribute_wh_name = 'Tier rating'
left join bbandt_mdwdb.d_lov old_os_domain on TRGT.task_attribute_wh_old_value = old_os_domain.row_id and TRGT.source_id = old_os_domain.source_id and (old_os_domain.dimension_class = 'OS_DOMAIN_C~CONFIGURATION_ITEM' or old_os_domain.row_key in (0,-1))  and TRGT.task_attribute_wh_name = 'OS Domain'
left join bbandt_mdwdb.d_lov new_os_domain on TRGT.task_attribute_wh_new_value = new_os_domain.row_id and TRGT.source_id = new_os_domain.source_id and (new_os_domain.dimension_class = 'OS_DOMAIN_C~CONFIGURATION_ITEM' or new_os_domain.row_key in (0,-1))  and TRGT.task_attribute_wh_name = 'OS Domain'
left join bbandt_mdwdb.d_lov old_os on TRGT.task_attribute_wh_old_value = old_os.row_id and TRGT.source_id = old_os.source_id and (old_os.dimension_class = 'OS_C~CONFIGURATION_ITEM' or old_os.row_key in (0,-1))  and TRGT.task_attribute_wh_name = 'Operating System'
left join bbandt_mdwdb.d_lov new_os on TRGT.task_attribute_wh_new_value = new_os.row_id and TRGT.source_id = new_os.source_id and (new_os.dimension_class = 'OS_C~CONFIGURATION_ITEM' or new_os.row_key in (0,-1))  and TRGT.task_attribute_wh_name = 'Operating System'
left join bbandt_mdwdb.d_lov old_dns_domain on TRGT.task_attribute_wh_old_value = old_dns_domain.row_id and TRGT.source_id = old_dns_domain.source_id and (old_dns_domain.dimension_class = 'DNS_DOMAIN_C~CONFIGURATION_ITEM' or old_dns_domain.row_key in (0,-1))  and TRGT.task_attribute_wh_name = 'DNS Domain'
left join bbandt_mdwdb.d_lov new_dns_domain on TRGT.task_attribute_wh_new_value = new_dns_domain.row_id and TRGT.source_id = new_dns_domain.source_id and (new_dns_domain.dimension_class = 'DNS_DOMAIN_C~CONFIGURATION_ITEM' or new_dns_domain.row_key in (0,-1)) and TRGT.task_attribute_wh_name = 'DNS Domain'
left join bbandt_mdwdb.d_lov old_chassis_type on TRGT.task_attribute_wh_old_value = old_chassis_type.row_id and TRGT.source_id = old_chassis_type.source_id and (old_chassis_type.dimension_class = 'CHASSIS_TYPE_C~CONFIGURATION_ITEM' or old_chassis_type.row_key in (0,-1)) and TRGT.task_attribute_wh_name = 'Chassis type'
left join bbandt_mdwdb.d_lov new_chassis_type on TRGT.task_attribute_wh_new_value = new_chassis_type.row_id and TRGT.source_id = new_chassis_type.source_id and (new_chassis_type.dimension_class = 'CHASSIS_TYPE_C~CONFIGURATION_ITEM' or new_chassis_type.row_key in (0,-1)) and TRGT.task_attribute_wh_name = 'Chassis type'
left join bbandt_mdwdb.d_lov old_device_type on TRGT.task_attribute_wh_old_value = old_device_type.row_id and TRGT.source_id = old_device_type.source_id and (old_device_type.dimension_class = 'DEVICE_TYPE_C~CONFIGURATION_ITEM' or old_device_type.row_key in (0,-1)) and TRGT.task_attribute_wh_name = 'Device type'
left join bbandt_mdwdb.d_lov new_device_type on TRGT.task_attribute_wh_new_value = new_device_type.row_id and TRGT.source_id = new_device_type.source_id and (new_device_type.dimension_class = 'DEVICE_TYPE_C~CONFIGURATION_ITEM' or new_device_type.row_key in (0,-1)) and TRGT.task_attribute_wh_name = 'Device type'
WHERE 
(COALESCE(CASE when TRGT.task_attribute_wh_name = 'Location' and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' then 
old_location.row_key when TRGT.task_attribute_wh_name = 'Support group' and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' 
then old_support_group.row_key when TRGT.task_attribute_wh_name = 'Cost center' and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' 
then old_cost_center.row_key when TRGT.task_attribute_wh_name = 'CPU manufacturer' 
and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' then old_cpu_manufacturer.row_key 
when TRGT.task_attribute_wh_name = 'Status(install_status)' and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' 
then old_install_status.row_key when TRGT.task_attribute_wh_name = 'Operational status' and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' 
then old_operational_status.row_key when TRGT.task_attribute_wh_name = 'Environment' and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' 
then old_environment.row_key when TRGT.task_attribute_wh_name = 'Role' and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' 
then old_role.row_key when TRGT.task_attribute_wh_name = 'Tier rating' and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' 
then old_tier_rating.row_key when TRGT.task_attribute_wh_name = 'OS Domain' and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' 
then old_os_domain.row_key when TRGT.task_attribute_wh_name = 'Operating System' and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' 
then old_os.row_key when TRGT.task_attribute_wh_name = 'DNS Domain' and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' 
then old_dns_domain.row_key when TRGT.task_attribute_wh_name = 'Chassis type' and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' 
then old_chassis_type.row_key when TRGT.task_attribute_wh_name = 'Device type' and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' 
then old_device_type.row_key when TRGT.task_attribute_wh_name = 'Model' and TRGT.task_attribute_wh_old_value <> 'UNSPECIFIED' 
then old_model.row_key else 0 end,-1))<>TRGT.task_attribute_wh_old_value_key
) temp;



 