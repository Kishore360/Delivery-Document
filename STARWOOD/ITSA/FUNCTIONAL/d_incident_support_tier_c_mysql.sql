 
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result

,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
FROM  starwood_mdsdb.task_final a
inner join starwood_mdsdb.incident_final c 
on a.sys_id=c.sys_id
inner  JOIN  starwood_mdsdb.request_category_final b
on b.sys_id=c.u_request_category   
left JOIN  starwood_mdwdb.d_incident b
on c.sys_id=b.row_id and c.sourceinstance=b.source_id
inner join starwood_mdsdb.cmdb_ci_service_final d
on a.u_service=d.sys_id and (name IN ('Booking.com','Central 
Reservation','DirectConnect','EZYield','HBSi','Hotwire','Orbitz','Priceline/Travelweb','PRSnet','Rational Dynamic Pricing','Saratoga','Valhalla','Valhalla Availability','Valhalla Booking Engine','Valhalla Data Quality Engine(DQE)','Valhalla Inventory','Valhalla Availability','Wholesaler Direct Connect (WDC)','Agoda','ISAC - Integrated Sales & Catering')
OR name like ('Branded%') 
OR name like ('Expedia%') 
OR name like ('IPS%') 
OR name like ('Property Mgt%') 
OR name like ('Revenue Management%')
OR name like ('Opera-PMS%') 
OR u_name  IN ('Valhalla','Central Reservation Systems') )
join starwood_mdsdb.sys_user_group_final e on c.assignment_group =e.sys_id and c.sourceinstance=e.sourceinstance

where 
support_tier_c<>case 
when  e.u_company ='Accenture' and (e.name not like '%Run%' and e.name not like '%Maintenance%' ) then 'TIER 1'
when e .u_company ='Accenture' and (e.name like '%Run%') then 'TIER 2'
when e.u_company ='Accenture' and (e.name like '%Maintenance%') then 'TIER 3' end
)a


