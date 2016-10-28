SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt

from pgi_mdsdb.problem_final a

left join pgi_mdwdb.d_calendar_date b

on b.row_id=date_format(convert_tz(a.u_target_date_of_system_proces,"GMT","UTC"),'%Y%m%d')

left join pgi_mdwdb.f_problem c

on c.system_process_target_date_c_key=b.row_key

where b.row_id<>date_format(convert_tz(a.u_target_date_of_system_proces,"GMT","UTC"),'%Y%m%d')) a;