 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdwdb.d_request_item d
JOIN svb_mdsdb.sc_req_item_final f ON d.row_id = f.sys_id and d.source_id=f.sourceinstance
where case when f.u_fcr = 1 then 'Y' else 'N' end <>d.first_call_resolution_flag
 )c
