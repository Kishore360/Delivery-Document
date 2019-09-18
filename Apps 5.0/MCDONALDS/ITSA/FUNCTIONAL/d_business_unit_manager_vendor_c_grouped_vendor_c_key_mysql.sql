

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select count(1) cnt from 
                mcdonalds_mdsdb.us_bu_manager_vendor_map_c_final bu_manager_vendor_map_c
left join mcdonalds_mdwdb.d_grouped_vendor_c d on SHA(lower(trim(bu_manager_vendor_map_c.vendor)))=d.row_id 
left join mcdonalds_mdwdb.d_business_unit_manager_vendor_c f on bu_manager_vendor_map_c.business_unit=f.business_unit
where d.row_key<>grouped_vendor_c_key)a;



