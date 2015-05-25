SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select COUNT(*) AS cnt
 from(
select s.sys_id,s.number, s.u_major_problem,i.row_id, i.major_problem_flag_c,
case when s.u_major_problem = '1' then 'Y' when s.u_major_problem ='0' then 'N' else null end as major 
from rambus_mdsdb.problem_final s
inner join rambus_workdb.dwh_d_problem i on s.sys_id collate utf8_unicode_ci=i.row_id )A
where coalesce(major_problem_flag_c,' ')<>coalesce(major,' ')

) c;