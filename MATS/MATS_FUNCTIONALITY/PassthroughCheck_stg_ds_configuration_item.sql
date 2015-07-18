
SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, 
CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from cmdb_ci_final to DS_CONFIGURATION_ITEM did not match'
ELSE 'SUCCESS' END AS Message 
FROM <<tenant>>_mdsdb.cmdb_ci_final WHERE CRC32(CONCAT( IFNULL(sys_id,'UNSPECIFIED'), IFNULL(sourceinstance,''), 
IFNULL(asset_tag,'UNSPECIFIED'), IFNULL(category,'UNSPECIFIED'), IFNULL(lease_id,'UNSPECIFIED'), IFNULL(model_id,'UNSPECIFIED'), IFNULL(name,''), 
IFNULL(subcategory,''),  IFNULL(sys_domain,'UNSPECIFIED'), IFNULL(sys_created_by,'UNSPECIFIED'), IFNULL(sys_updated_by,''),
IFNULL(sys_created_on,'UNSPECIFIED'), IFNULL(sys_updated_on,'UNSPECIFIED'), IFNULL(company,'UNSPECIFIED'))) 
NOT IN (SELECT CRC32(CONCAT( IFNULL(row_id,'UNSPECIFIED'), IFNULL(source_id,'UNSPECIFIED'), IFNULL(asset_tag,'UNSPECIFIED'), IFNULL(category,''), 
IFNULL(lease_contract,'UNSPECIFIED'), IFNULL(model_number,'UNSPECIFIED'), IFNULL(name,'UNSPECIFIED'), IFNULL(subcategory,'UNSPECIFIED'), IFNULL(domain_id,''),
 IFNULL(created_by,'UNSPECIFIED'), IFNULL(changed_by,'UNSPECIFIED'), IFNULL(created_on,'UNSPECIFIED'), IFNULL(changed_on,''), 
IFNULL(company_id,'UNSPECIFIED'))) FROM <<tenant>>_workdb.stg_ds_configuration_item)
