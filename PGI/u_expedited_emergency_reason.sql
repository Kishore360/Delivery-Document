SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt 
from pgi_mdsdb.change_request_final a

join pgi_mdwdb.d_change_request b

on a.sys_id=b.row_id and

a.sourceinstance=b.source_id

where u_expedited_emergency_reason<>expedited_emergency_reason_c) a;