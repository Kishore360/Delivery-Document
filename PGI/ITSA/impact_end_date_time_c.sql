SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 

FROM (select count(1) as cnt

from pgi_mdsdb.change_request_final a


left join pgi_mdwdb.d_change_request b


on b.impact_end_date_time_c=convert_tz(a.u_impact_end_date_time,'GMT','UTC')


where b.impact_end_date_time_c<>convert_tz(a.u_impact_end_date_time,'GMT','UTC')) a;