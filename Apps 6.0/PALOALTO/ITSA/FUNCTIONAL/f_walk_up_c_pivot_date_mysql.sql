

 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from paloalto_mdsdb.u_walk_up_final s
left  JOIN paloalto_mdwdb.f_walk_up_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
WHERE t.pivot_date <> convert_tz(s.opened_at,'GMT','America/Los_Angeles') ) temp


