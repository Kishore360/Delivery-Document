 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pan_mdsdb.u_walk_up_final s
left  JOIN pan_mdwdb.d_walk_up_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
WHERE t.created_on
 <> convert_tz(s.sys_created_on,'GMT','America/Los_Angeles')) temp
 
