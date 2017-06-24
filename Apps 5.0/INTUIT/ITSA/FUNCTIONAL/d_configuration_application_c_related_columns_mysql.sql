SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.cmdb_ci_appl_final i 
JOIN intuit_mdwdb.d_configuration_application_c f_cr ON sys_id=row_id and sourceinstance=source_id
where
i.asset_tag<>f_cr.asset_tag or
		i.assigned_to<>f_cr.assigned_to or
		i.category<>f_cr.category or
		i.department<>f_cr.department or
		i.location<>f_cr.location or
		i.managed_by<>f_cr.managed_by or
		i.manufacturer<>f_cr.manufacturer or
		i.model_number<>f_cr.model_number or
		i.name<>f_cr.name or
		i.owned_by<>f_cr.owned_by or
		i.subcategory<>f_cr.subcategory or
		i.sys_class_name<>f_cr.class