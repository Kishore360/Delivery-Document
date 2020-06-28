SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt

from truist_mdsdb.change_request_final a

 join truist_mdwdb.d_change_request b

on a.sys_id=b.row_id and
a.sourceinstance=b.source_id

where case when u_change_exception=1 then 'Y' else 'N' end<>change_exception_c) a;



