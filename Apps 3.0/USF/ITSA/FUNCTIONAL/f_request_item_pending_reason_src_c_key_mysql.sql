SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
Count(1) as cnt
from  usf_mdsdb.sc_req_item_final a11
left join usf_mdwdb.f_request_item a12
on a11.sys_id=a12.row_id and a11.sourceinstance=a12.source_id
left join usf_mdwdb.d_lov  a13
on concat('U_PENDING~SC_REQ_ITEM~~~',a11.u_pending)=a13.row_id
where coalesce(a13.row_key,CASE WHEN a11.u_pending IS NULL THEN 0 else -1 end)<>a12.pending_reason_src_c_key)a;



