SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) cnt
 from starwood_mdsdb.request_category_final cat
inner join starwood_mdsdb.incident_final SRC on cat.sys_id=SRC.u_request_category   and SRC.sourceinstance=cat.sourceinstance
 JOIN  starwood_mdwdb.d_incident dinc on SRC.sys_id=dinc.row_id and SRC.sourceinstance=dinc.source_id
inner join starwood_mdwdb.f_incident c  on SRC.sys_id=c.row_id and SRC.sourceinstance=c.source_id
join starwood_mdsdb.task_final a on  a.sys_id=SRC.sys_id and a.sourceinstance=SRC.sourceinstance
inner join starwood_mdsdb.cmdb_ci_service_final d
on a.u_service=d.sys_id and a.sourceinstance=d.sourceinstance
and name IN ('Booking.com','Central 
Reservation','DirectConnect','EZYield','HBSi','Hotwire','Orbitz','Priceline/Travelweb','PRSnet',
'Rational Dynamic Pricing','Saratoga','Valhalla','Valhalla Availability','Valhalla Booking Engine','Valhalla Data Quality Engine(DQE)','Valhalla Inventory',
'Valhalla Availability','Wholesaler Direct Connect (WDC)','Agoda','ISAC - Integrated Sales & Catering')
OR name like ('Branded%') 
OR name like ('Expedia%') 
OR name like ('IPS%') 
OR name like ('Property Mgt%') 
OR name like ('Revenue Management%')
OR name like ('Opera-PMS%') 
OR u_name  IN ('Valhalla','Central Reservation Systems') 
join starwood_mdwdb.d_internal_organization z  ON z.row_key = c.assignment_group_key
 join  starwood_mdwdb.d_lov_map map on 
c.state_src_key =map.src_key and map.dimension_class = 'STATE~INCIDENT'
and map.dimension_wh_code = 'RESOLVED'
where  
case when dinc.revenue_impacting_c_flag='Y' 
and z.organization_name in ('Service Desk San Antonio', 'Service Desk Direct Connect') 
AND a.reassignment_count = 0 and map.dimension_wh_code = 'RESOLVED'
THEN 1 ELSE 0        end <>c.fcr_revenue_impacting_c)i