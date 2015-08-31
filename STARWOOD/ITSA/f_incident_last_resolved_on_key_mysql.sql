
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select COUNT(*) cnt from(
SELECT A.SYS_ID,B.ROW_ID,
B.  last_resolved_on_key B_last_resolved_on_key ,
case when year <2000 then A.last_resolved_on_key+20000000 else A.last_resolved_on_key 
end as  A_last_resolved_on_key from
(SELECT SRC.SYS_ID,SRC.sourceinstance, 
DATE_FORMAT(CONVERT_TZ(SRC.resolved_at,'GMT','America/New_York'),'%Y')  AS   year,
DATE_FORMAT(CONVERT_TZ(SRC.resolved_at,'GMT','America/New_York'),'%Y%m%d')  AS   last_resolved_on_key
FROM  starwood_mdsdb.task_final a
inner join starwood_mdsdb.incident_final SRC 
on a.sys_id=SRC.sys_id
inner join starwood_mdsdb.cmdb_ci_service_final d
on a.u_service=d.sys_id 
inner  JOIN  starwood_mdsdb.request_category_final b
on b.sys_id=SRC.u_request_category
WHERE 
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
)A
 JOIN  
(SELECT  last_resolved_on_key,source_id,ROW_ID FROM  starwood_mdwdb.f_incident
where state_src_code>4
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_last_resolved_on_key<> B_last_resolved_on_key)E;
