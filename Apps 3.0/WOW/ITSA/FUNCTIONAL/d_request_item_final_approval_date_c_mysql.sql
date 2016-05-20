SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from wow_mdsdb.sc_req_item_final s
left join wow_mdwdb.d_request_item t 
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
where CONVERT_TZ(s.u_final_approval_date,'GMT','US/Mountain') 
<> t.final_approval_date_c) temp