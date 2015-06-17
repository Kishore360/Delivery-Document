SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select COUNT(*) AS cnt
from (
select  a.sys_id,a.u_problem_manager, c.row_id,c.row_key,b.problem_manager_key_c from rambus_mdsdb.problem_final a
inner join rambus_workdb.dwh_f_problem b on a.sys_id collate utf8_general_ci = b.row_id and a.sourceinstance=b.source_id
left outer join rambus_workdb.dwh_d_internal_contact c on 
 coalesce(a.u_problem_manager collate utf8_general_ci,' ') = coalesce(c.row_id,' ') where case when  a.u_problem_manager is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end <> b.problem_manager_key_c)A


) c;