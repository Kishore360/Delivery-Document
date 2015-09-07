 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result 
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from (
select a.sys_id,e.row_id 
from starwood_mdsdb.task_final a

inner join starwood_mdsdb.incident_final c 
on a.sys_id=c.sys_id 

inner join starwood_mdsdb.cmdb_ci_service_final d
on a.u_service=d.sys_id 

inner  JOIN  starwood_mdsdb.request_category_final b
on b.sys_id=c.u_request_category 

LEFT join starwood_mdwdb.f_incident e on 
  c.sys_id=e.row_id
  AND c.sourceinstance = e.source_id
  where d.name IN ('Booking.com','Central 
Reservation','DirectConnect','EZYield','HBSi','Hotwire','Orbitz','Priceline/Travelweb','PRSnet','Rational Dynamic Pricing','Saratoga',
'Valhalla','Valhalla Availability','Valhalla Booking Engine','Valhalla Data Quality Engine(DQE)','Valhalla Inventory',
'Valhalla Availability','Wholesaler Direct Connect (WDC)','Agoda','ISAC - Integrated Sales & Catering')
 OR 
 d.name like 
('Branded%') 
OR d.name like ('Expedia%') 
OR d.name like ('IPS%') 
OR d.name like ('Property Mgt%') 
OR d.name like ('Revenue Management%')
 OR d.name like ('Opera-PMS%') 
  OR b.u_name  IN ('Valhalla','Central Reservation Systems') )x
  where  row_id is null
)i
