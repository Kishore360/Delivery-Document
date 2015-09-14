


SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result , CASE WHEN COUNT(1) > 0 
THEN 'Pass through columns from DS_CONFIGURATION_ITEM to D_CONFIGURATION_ITEM did not match' ELSE 'SUCCESS' END AS Message FROM 
<<tenant>>_workdb.ds_configuration_item WHERE CONCAT( IFNULL(row_id,''), IFNULL(asset_tag,''), IFNULL(assigned_to,''), IFNULL(category,''), 
IFNULL(department,''), IFNULL(lease_contract,''), IFNULL(location,''), IFNULL(managed_by,''), IFNULL(manufacturer,''), IFNULL(model_number,''), 
IFNULL(name,''), IFNULL(owned_by,''), IFNULL(subcategory,''), IFNULL(support_group,''),  IFNULL(vendor,''), IFNULL(supported_by,''), 
IFNULL(company,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))
 NOT IN (SELECT CONCAT( IFNULL(row_id,''), IFNULL(asset_tag,''), IFNULL(assigned_to,''), IFNULL(category,''), IFNULL(department,''),
 IFNULL(lease_contract,''), IFNULL(location,''), IFNULL(managed_by,''), IFNULL(manufacturer,''), IFNULL(model_number,''), IFNULL(name,''), 
IFNULL(owned_by,''), IFNULL(subcategory,''), IFNULL(support_group,''),  IFNULL(vendor,''), IFNULL(supported_by,''), IFNULL(company,''), 
IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))
 FROM <<tenant>>_mdwdb.d_configuration_item)