SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select COUNT(*) AS cnt
from rambus_mdsdb.problem_final s
inner join rambus_workdb.dwh_d_problem i on s.sys_id collate utf8_unicode_ci=i.row_id 
and s.sourceinstance=i.source_id
where coalesce(CONVERT_TZ(s.u_major_problem_date,'GMT','America/New_York'),'0')
<>coalesce(i.major_problem_on_c,'0')

) c;