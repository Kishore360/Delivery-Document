SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt


from pgi_mdsdb.problem_final a


left join pgi_mdwdb.f_problem b


on a.sys_id=b.row_id and

a.sourceinstance=b.source_id


left join pgi_mdwdb.d_calendar_date c

on c.row_id=date_format(convert_tz(a.u_target_date_for_full_resolut,"GMT","UTC"),'%Y%m%d')

where b.full_resolution_target_date_c_key<>c.row_key) a;