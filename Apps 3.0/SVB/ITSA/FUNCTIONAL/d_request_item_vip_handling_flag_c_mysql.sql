SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from svb_mdsdb.sc_req_item_final a
left join svb_mdwdb.d_request_item b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
where case when a.u_vip_handling='0'then 'N' else 'Y' end<>b.vip_handling_flag_c)g
