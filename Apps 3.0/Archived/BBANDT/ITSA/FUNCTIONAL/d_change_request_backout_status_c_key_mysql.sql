SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt

from bbandt_mdsdb.change_request_final a

 join bbandt_mdwdb.d_change_request b

on a.sys_id=b.row_id and
a.sourceinstance=b.source_id

left join bbandt_mdwdb.d_lov d
on concat('U_BACKOUT_STATUS~CHANGE_REQUEST~~~',a.u_backout_status)=d.row_id and dimension_class='U_BACKOUT_STATUS~CHANGE_REQUEST'
where coalesce(d.row_key,case when u_backout_status is null then 0 else -1 end) <>b.backout_status_c_key) a; 