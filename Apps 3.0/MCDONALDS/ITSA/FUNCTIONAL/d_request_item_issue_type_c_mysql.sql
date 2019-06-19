SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) cnt
from mcdonalds_mdwdb.d_request_item a 
left outer join mcdonalds_mdsdb.sc_req_item_final b 
on a.row_id =b.sys_id 
and a.source_id=b.sourceinstance
where coalesce(a.issue_type_c,'') <>coalesce(b.u_issue_type,'') and a.soft_deleted_flag='N' ) z;


