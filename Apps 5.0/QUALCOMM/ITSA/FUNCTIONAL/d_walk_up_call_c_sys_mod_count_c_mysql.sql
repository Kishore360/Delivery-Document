 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from qualcomm_mdsdb.u_walk_up_call_final s
left  JOIN qualcomm_mdwdb.d_walk_up_call_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
WHERE t.sys_mod_count_c <> s.sys_mod_count  
and s.CDCTYPE='X') temp;