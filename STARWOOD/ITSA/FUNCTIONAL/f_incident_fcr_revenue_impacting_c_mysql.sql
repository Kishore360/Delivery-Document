
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation  failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message
FROM  starwood_mdsdb.task_final a
inner join starwood_mdsdb.incident_final c 
on a.sys_id=c.sys_id
inner  JOIN  starwood_mdsdb.request_category_final b
on b.sys_id=c.u_request_category   
 JOIN  starwood_mdwdb.d_incident d
on c.sys_id=d.row_id and c.sourceinstance=d.source_id
inner join starwood_mdsdb.cmdb_ci_service_final e
on a.u_service=e.sys_id and (name IN ('Booking.com','Central 
Reservation','DirectConnect','EZYield','HBSi','Hotwire','Orbitz','Priceline/Travelweb','PRSnet','Rational Dynamic Pricing','Saratoga','Valhalla','Valhalla Availability','Valhalla Booking Engine','Valhalla Data Quality Engine(DQE)','Valhalla Inventory','Valhalla Availability','Wholesaler Direct Connect (WDC)','Agoda','ISAC - Integrated Sales & Catering')
OR name like ('Branded%') 
OR name like ('Expedia%') 
OR name like ('IPS%') 
OR name like ('Property Mgt%') 
OR name like ('Revenue Management%')
OR name like ('Opera-PMS%') 
OR u_name  IN ('Valhalla','Central Reservation Systems') )
left JOIN  starwood_mdwdb.f_incident f 
on  d.row_id=f.row_id and d.source_id=f.source_id
join starwood_mdwdb.d_internal_organization z  ON z.row_key = f.assignment_group_key
 join  starwood_mdwdb.d_lov_map c on 
f.state_src_key =c.src_key and c.dimension_class = 'STATE~INCIDENT'
and c.dimension_wh_code = 'RESOLVED'
where  
case when d.revenue_impacting_c_flag='Y' 
and z.organization_name in ('Service Desk San Antonio', 'Service Desk Direct Connect') 
AND a.reassignment_count = 0 and c.dimension_wh_code = 'RESOLVED'
THEN 1 ELSE 0        end <>f.fcr_revenue_impacting_c