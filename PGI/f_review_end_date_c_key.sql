SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select b.row_id,date_format(convert_tz(a.u_end,"GMT","UTC"),'%Y%m%d'), b.row_key,c.review_end_date_c_key

from pgi_mdsdb.problem_final a

left join pgi_mdwdb.d_calendar_date b

on b.row_id=date_format(convert_tz(a.u_end,"GMT","UTC"),'%Y%m%d')

left join pgi_mdwdb.f_problem c

on b.row_key=c.review_end_date_c_key

where b.row_id<>date_format(convert_tz(a.u_end,"GMT","UTC"),'%Y%m%d')) a;