SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from f_incident a
inner join uclahealth_mdsdb.incident_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
left join d_building_c c
on b.u_building=c.row_id
and b.sourceinstance=c.source_id
where c.row_key<>a.building_c_key)e