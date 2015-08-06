SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 

FROM (select count(1) as cnt

from pgi_mdsdb.change_request_final a

left join pgi_mdwdb.f_change_request b

on a.sys_id=b.row_id and

a.sourceinstance=b.source_id

left join pgi_mdwdb.d_calendar_date c

on c.row_id=date_format(convert_tz(a.u_impact_end_date_time,'GMT','UTC'),'%Y%m%d')

where b.impact_end_date_time_c_key<>c.row_key) a;
