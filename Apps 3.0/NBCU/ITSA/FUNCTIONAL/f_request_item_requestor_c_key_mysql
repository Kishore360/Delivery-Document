SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  nbcu_mdwdb.f_request_item a11
left join nbcu_mdsdb.sc_req_item_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
left join nbcu_mdwdb.d_internal_contact a13
on concat('INTERNAL_CONTACT~',a12.u_requestor)=a13.row_id
where a13.row_key<>a11.requestor_c_key)a
