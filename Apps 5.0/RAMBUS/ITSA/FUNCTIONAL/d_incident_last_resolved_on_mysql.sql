SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from rambus_mdsdb.incident_final s
inner join rambus_workdb.d_incident i on s.sys_id =i.row_id 
and s.sourceinstance=i.source_id
join rambus_mdwdb.f_incident d on d.state_src_key=i.row_key
left join rambus_workdb.d_lov_map c on c.src_key=d.state_src_key
where coalesce(i.last_resolved_on,' ')<>CONVERT_TZ(CASE 
when c.dimension_wh_code IN('OPEN') then s.resolved_at
WHEN c.dimension_wh_code IN('RESOLVED','CLOSED') 
AND coalesce(s.resolved_at,s.closed_at) IS NULL THEN sys_updated_on 
ELSE coalesce(s.resolved_at,s.closed_at) END,'GMT','America/Los_Angeles')
) c;
 
 


 