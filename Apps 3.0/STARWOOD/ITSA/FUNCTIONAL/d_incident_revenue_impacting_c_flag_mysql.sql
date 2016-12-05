
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


where  
case when e.name not in ('ISAC - Integrated Sales & Catering') then 'Y' else 'N' end <>d.revenue_impacting_c_flag