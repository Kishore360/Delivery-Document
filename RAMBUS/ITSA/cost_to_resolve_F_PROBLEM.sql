SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select COUNT(*) AS cnt
from rambus_workdb.dwh_f_problem i 
left outer join rambus_mdsdb.problem_final s on s.sys_id collate utf8_unicode_ci=i.row_id 
and s.sourceinstance=i.source_id
where coalesce(s.u_cost_to_resolve ,'0')<>coalesce(i.cost_to_resolve_c,'0')

) c;