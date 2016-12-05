 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result 
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM  (
select count(1) as cnt from (SELECT SRC.sys_id,TRGT.row_id,COALESCE( SRC.sys_created_by,'') as abc, COALESCE(TRGT.created_by ,'') as def
FROM  starwood_mdsdb.task_final a
inner join starwood_mdsdb.incident_final SRC 
on a.sys_id=SRC.sys_id
inner join starwood_mdsdb.cmdb_ci_service_final d
on a.u_service=d.sys_id 
inner  JOIN  starwood_mdsdb.request_category_final b
on b.sys_id=SRC.u_request_category   
LEFT JOIN starwood_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where 
d.name IN ('Booking.com','Central 
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
)abc
  where abc<>def
)i