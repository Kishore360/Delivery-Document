
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pan6_mdsdb.u_walk_up_final s
left  JOIN pan6_mdwdb.f_walk_up_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
left join pan6_mdwdb.d_calendar_date l
on  date_format(convert_tz(s.closed_at,'GMT','America/Los_Angeles'),'%Y%m%d') = l.row_id
WHERE t.closed_on_key <> l.row_key) temp
 
 
  
