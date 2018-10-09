 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pan6_mdsdb.u_walk_up_final s
LEFT JOIN pan6_mdsdb.u_badge_final badge
  on s.u_badge_number=badge.sys_id and s.sourceinstance=badge.sourceinstance
left  JOIN pan6_mdwdb.d_walk_up_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
WHERE t.badge_number <> case when length(u_badge_number)=32 then u_number else u_badge_number end 
 ) temp
 
 