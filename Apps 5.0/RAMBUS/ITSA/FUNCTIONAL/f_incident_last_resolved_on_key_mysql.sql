SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from rambus_mdwdb.f_incident f 
JOIN rambus_mdwdb.d_lov_map lov_map 
ON f.state_src_key = lov_map.src_key and f.state_src_code=lov_map.dimension_code 
and lov_map.dimension_class in ('STATE~INCIDENT','STATE~ADHOC_REQ')
AND lov_map.dimension_wh_code IN('RESOLVED','CLOSED')
and f.last_resolved_on_key is null
left join rambus_mdwdb.d_calendar_date cal on cal.row_id = DATE_FORMAT(f.changed_on,'%Y%m%d')
where coalesce(f.closed_on_key,cal.row_key)<> f.last_resolved_on_key)a


