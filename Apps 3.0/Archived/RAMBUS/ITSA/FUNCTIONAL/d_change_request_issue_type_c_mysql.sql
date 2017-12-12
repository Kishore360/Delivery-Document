SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) cnt
from rambus_mdwdb.d_change_request a 
left outer join rambus_mdsdb.change_request_final b 
on a.row_id =b.sys_id 
and a.source_id=b.sourceinstance
where coalesce(a.issue_type_c,'') <>coalesce(b.u_issue_type,'') and a.soft_deleted_flag='N' ) z;