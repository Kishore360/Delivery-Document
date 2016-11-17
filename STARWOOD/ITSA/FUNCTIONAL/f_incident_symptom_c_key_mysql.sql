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
left join starwood_mdwdb.d_lov b on 
 CONCAT('SYMPTOM~INCIDENT~~~',SRC.u_symptom)=b.row_id and SRC.sourceinstance=b.source_id
where (d.name IN ('Booking.com','Central 
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
  OR cat.u_name  IN ('Valhalla','Central Reservation Systems')  
and  b.dimension_class like '%SYMPTOM~INCIDENT%' )
 
and coalesce(b.row_key,case when u_symptom is null then 0 else -1 end )<>c.symptom_c_key
)i;