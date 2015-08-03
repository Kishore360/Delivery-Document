SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt
from pgi_mdsdb.change_request_final a

left join pgi_mdwdb.d_calendar_date b

on b.row_id=date_format(convert_tz(a.u_impact_start_date_time,'GMT','UTC'),'%Y%m%d')

left join pgi_mdwdb.f_change_request c

on b.row_key=c.impact_start_date_time_c_key

where b.row_id<>date_format(convert_tz(a.u_impact_start_date_time,'GMT','UTC'),'%Y%m%d')) a;