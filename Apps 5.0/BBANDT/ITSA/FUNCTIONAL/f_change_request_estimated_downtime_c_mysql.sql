SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt

from bbandt_mdsdb.change_request_final a

 join bbandt_mdwdb.f_change_request b

on a.sys_id=b.row_id and
a.sourceinstance=b.source_id

 
where estimated_downtime_c<>TIMESTAMPDIFF(second,'1970-01-01 00:00:00',a.u_estimated_downtime)) a;



