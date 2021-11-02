SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select count(1) cnt from 
                mcd_mdsdb.us_bu_manager_vendor_map_c_final bu_manager_vendor_map_c
left join mcd_mdwdb.d_businessunit_custom_c d on SHA(lower(trim(bu_manager_vendor_map_c.business_unit)))=d.row_id 
left join mcd_mdwdb.d_business_unit_manager_vendor_c f on bu_manager_vendor_map_c.business_unit=f.business_unit
where d.row_key<>businessunit_custom_c_key)a;


