 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pan6_mdsdb.u_walk_up_final s
left  JOIN pan6_mdwdb.d_walk_up_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
WHERE t.last_resolved_on <> convert_tz(coalesce(s.u_resolved_at,s.closed_at,s.sys_updated_on),'GMT','America/Los_Angeles')) temp

