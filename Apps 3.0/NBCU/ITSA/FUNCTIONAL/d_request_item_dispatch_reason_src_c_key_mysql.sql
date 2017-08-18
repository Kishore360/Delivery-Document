SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(1) as cnt
from   nbcu_mdwdb.d_request_item a11
left join  nbcu_mdsdb.sc_req_item_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
join nbcu_mdwdb.d_lov a13
on COALESCE(CONCAT('U_DISPATCH_REASON~INCIDENT~~~',a12.u_dispatch_reason_req),'UNSPECIFIED')=a13.row_id
where COALESCE(a13.row_key,CASE WHEN a12.u_dispatch_reason_req IS NULL THEN 0 else -1 end) <>a11.dispatch_reason_src_c_key)a





