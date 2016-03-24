SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  nbcu_mdwdb.d_request_item a11
left join nbcu_mdsdb.sc_req_item_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
where a12.u_other<>a11.other_c)a
