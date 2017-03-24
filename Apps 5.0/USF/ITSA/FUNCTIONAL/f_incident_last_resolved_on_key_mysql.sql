SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from usf_mdsdb.incident_final a
   JOIN  usf_mdwdb.f_incident b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
 JOIN usf_mdwdb.d_lov_map l 
ON b.state_src_key = l.src_key and b.state_src_code=l.dimension_code 
 join usf_mdwdb.d_calendar_date c
on  DATE_FORMAT(CONVERT_TZ(a.resolved_at,'GMT','US/Pacific'),'%Y%m%d')= c.row_id 
 where  c.row_key <> b.last_resolved_on_key
and l.dimension_class = 'STATE~INCIDENT'
AND l.dimension_wh_code IN('RESOLVED','CLOSED')
)b