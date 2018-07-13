


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_cmdb_activity_c.task_attribute_wh_old_value' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT Count(1) AS CNT 
FROM bbandt_mdsdb.sys_audit_final SRC 
LEFT JOIN bbandt_mdwdb.f_cmdb_activity_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE 
(
CASE SRC.fieldname
WHEN 'location' then COALESCE(SRC.oldvalue,'UNSPECIFIED')
WHEN 'support_group' then COALESCE(CONCAT('GROUP~',SRC.oldvalue),'UNSPECIFIED')
WHEN 'cost_center' then COALESCE(SRC.oldvalue,'UNSPECIFIED')
WHEN 'model_id' then COALESCE(SRC.oldvalue,'UNSPECIFIED')
WHEN 'cpu_manufacturer' then COALESCE(CONCAT('SUBSIDIARY~',SRC.oldvalue),'UNSPECIFIED')
WHEN 'install_status' then COALESCE(CONCAT('INSTALL_STATUS_C~CONFIGURATION_ITEM~~~',upper(SRC.oldvalue)),'UNSPECIFIED')
WHEN 'operational_status' then COALESCE(CONCAT('OPERATIONAL_STATUS_C~CONFIGURATION_ITEM~~~',upper(SRC.oldvalue)),'UNSPECIFIED')
WHEN 'u_environment' then COALESCE(CONCAT('ENVIRONMENT_C~CONFIGURATION_ITEM~~~',upper(SRC.oldvalue)),'UNSPECIFIED')
WHEN 'u_role' then COALESCE(CONCAT('ROLE_C~CONFIGURATION_ITEM~~~',upper(SRC.oldvalue)),'UNSPECIFIED')
WHEN 'u_tier_rating' then COALESCE(CONCAT('TIER_RATING_C~CONFIGURATION_ITEM~~~',upper(SRC.oldvalue)),'UNSPECIFIED')
WHEN 'os_domain' then COALESCE(CONCAT('OS_DOMAIN_C~CONFIGURATION_ITEM~~~',upper(SRC.oldvalue)),'UNSPECIFIED')
WHEN 'os' then COALESCE(CONCAT('OS_C~CONFIGURATION_ITEM~~~',upper(SRC.oldvalue)),'UNSPECIFIED')
WHEN 'dns_domain' then COALESCE(CONCAT('DNS_DOMAIN_C~CONFIGURATION_ITEM~~~',upper(SRC.oldvalue)),'UNSPECIFIED')
WHEN 'chassis_type' then COALESCE(CONCAT('CHASSIS_TYPE_C~CONFIGURATION_ITEM~~~',upper(SRC.oldvalue)),'UNSPECIFIED')
WHEN 'device_type' then COALESCE(CONCAT('DEVICE_TYPE_C~CONFIGURATION_ITEM~~~',upper(SRC.oldvalue)),'UNSPECIFIED')
ELSE COALESCE(SRC.oldvalue,'UNSPECIFIED') END
) <> TRGT.task_attribute_wh_old_value
) temp;




 



