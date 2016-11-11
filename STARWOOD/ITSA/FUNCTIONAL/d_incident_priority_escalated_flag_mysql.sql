
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.priority_escalated_flag' ELSE 'SUCCESS' END as Message from 
 (
select case when locate('Y',b.res)>0 then 'Y' else 'N' end as priority_escalation,c.sys_id,
e.priority_escalated_flag as target from 
(
select group_concat(a.flag) as res,a.documentkey from (
select case when newvalue<oldvalue then 'Y' else 'N' end as flag,documentkey from starwood_mdsdb.sys_audit_final 
 where
tablename = 'incident' 
AND fieldname =  'priority' and oldvalue is not null and newvalue is not null
)a group by a.documentkey
)b
 join starwood_mdsdb.incident_final c on b.documentkey=c.sys_id
 join  starwood_mdsdb.task_final a on a.sys_id=c.sys_id
 inner join starwood_mdsdb.cmdb_ci_service_final d on a.u_service=d.sys_id 
inner  JOIN  starwood_mdsdb.request_category_final b on b.sys_id=c.u_request_category 
join starwood_mdwdb.d_incident e on c.sys_id = e.row_id and c.sourceinstance = e. source_id
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

) e where priority_escalation<>target



