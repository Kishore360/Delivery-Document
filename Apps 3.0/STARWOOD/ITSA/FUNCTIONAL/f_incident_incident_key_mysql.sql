
  select  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.incident_key' ELSE 'SUCCESS' END as Message from 
(select a.sys_id,e.row_id,c.severity AS SEVERITY_a_CODE ,COALESCE(LKP.row_key,CASE WHEN c.sys_domain IS NULL THEN 0 else '-1' end) abc, COALESCE(e.incident_key,'') def
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
 LEFT JOIN starwood_mdwdb.d_incident LKP 
 ON ( c.sys_id= LKP.row_id 
AND c.sourceinstance= LKP.source_id )
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
  OR b.u_name  IN ('Valhalla','Central Reservation Systems')
  )A
 where A.abc <>A.def
