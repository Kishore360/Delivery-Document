SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select COUNT(*) AS cnt
from rambus_mdsdb.problem_final s
inner join rambus_workdb.dwh_d_problem i on s.sys_id collate utf8_unicode_ci=i.row_id 
where coalesce(s.U_on_hold_type collate utf8_unicode_ci,' ')<>coalesce(i.on_hold_type_c ,' ')

) c;