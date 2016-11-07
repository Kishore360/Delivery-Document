SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(*) as cnt 
from rei_mdwdb.d_change_request a join 
rei_mdsdb.change_request_final b 
on (a.row_id=b.sys_id and a.source_id=b.sourceinstance)
and COALESCE(u_downtime_details,'UNSPECIFIED') <>a.downtime_details_c )c ;