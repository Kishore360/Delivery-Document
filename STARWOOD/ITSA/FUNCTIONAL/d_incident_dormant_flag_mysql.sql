 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.active_flag' ELSE 'SUCCESS' END as Message
 FROM
(
select count(1) as cnt from(SELECT SRC.sys_id,TRGT.row_id, CASE WHEN timestampdiff(DAY,TRGT.changed_on,FRESH.lastupdated)>30
AND  LM.dimension_wh_code='OPEN' THEN 'Y' ELSE 'N' END as abc, COALESCE(TRGT.dormant_flag ,'')as def


FROM  starwood_mdsdb.task_final a
inner join starwood_mdsdb.incident_final SRC 
on a.sys_id=SRC.sys_id
inner join starwood_mdsdb.cmdb_ci_service_final d
on a.u_service=d.sys_id 
inner  JOIN  starwood_mdsdb.request_category_final b
on b.sys_id=SRC.u_request_category   
LEFT JOIN starwood_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN starwood_mdwdb.f_incident TRGTF
 ON (TRGTF.incident_key =TRGT.row_key  
 AND TRGTF.source_id= TRGT.source_id  )
 
LEFT JOIN starwood_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key
-- LEFT JOIN starwood_mdwdb.d_calendar_date LKP 
-- on (LKP.row_id = date_format(convert_tz(SRC.closed_at,"GMT","America/New_York"),'%Y%m%d')  and LKP.source_id=0)
where timestampdiff(DAY,TRGT.changed_on, (SELECT MAX(lastupdated) AS lastupdated
FROM starwood_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))>30
  AND LM.dimension_class = 'STATE~INCIDENT'
  AND LM.dimension_wh_code = 'OPEN'
  AND TRGT.dormant_flag = 'N' and 
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