SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
			from mcdonalds_mdwdb.d_grouped_vendor_c d join (
	select distinct grouped_vendor_name, sourceinstance from mcdonalds_mdsdb.us_vendor_group_map_c_final
	union
	select distinct grouped_vendor_name , sourceinstance from mcdonalds_mdsdb.us_assignee_vendor_map_c_final
	union
	select distinct vendor, sourceinstance from mcdonalds_mdsdb.us_bu_manager_vendor_map_c_final
	) as t on SHA(lower(trim(t.grouped_vendor_name)))=d.row_id
	where t.grouped_vendor_name not in ('UNSPECIFIED','UNKNOWN')
	  
	and t.grouped_vendor_name<>d.grouped_vendor_name
	
	
	