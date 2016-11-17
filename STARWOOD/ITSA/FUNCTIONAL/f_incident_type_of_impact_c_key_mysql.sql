SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) cnt
 from starwood_mdsdb.request_category_final cat
inner join starwood_mdsdb.incident_final SRC on cat.sys_id=SRC.u_request_category   and SRC.sourceinstance=cat.sourceinstance
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
left join starwood_mdwdb.d_lov lov on 
lov.dimension_class like '%TYPE_OF_IMPACT~INCIDENT%'
and CONCAT('TYPE_OF_IMPACT~INCIDENT~~~',SRC.u_type_of_impact)=lov.row_id
 
where lov.row_key<>c.type_of_impact_c_key

)i; 