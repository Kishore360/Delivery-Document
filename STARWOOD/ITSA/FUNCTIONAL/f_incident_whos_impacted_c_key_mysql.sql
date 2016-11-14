
 SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,
CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM
 (
select count(1) as cnt  
FROM  starwood_mdsdb.task_final a
inner join starwood_mdsdb.incident_final c 
on a.sys_id=c.sys_id
inner  JOIN  starwood_mdsdb.request_category_final b
on b.sys_id=c.u_request_category   
left JOIN  starwood_mdwdb.d_incident b
on c.sys_id=b.row_id and c.sourceinstance=b.source_id
inner join starwood_mdsdb.cmdb_ci_service_final d
on a.u_service=d.sys_id and name IN ('Booking.com','Central 
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

left join starwood_mdwdb.d_lov lov
on 
lov.dimension_class like '%WHOS_IMPACTED~INCIDENT%'
and CONCAT('WHOS_IMPACTED~INCIDENT~~~',c.u_whos_impacted)=lov.row_id

left join starwood_mdwdb.f_incident c  on a.sys_id=c.row_id and a.sourceinstance=c.source_id
 where b.row_key<>c.whos_impacted_c_key

)i; 