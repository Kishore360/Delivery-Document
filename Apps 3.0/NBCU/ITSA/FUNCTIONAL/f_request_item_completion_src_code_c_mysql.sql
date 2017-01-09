SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from nbcu_mdsdb.sc_req_item_final s
left  JOIN nbcu_mdwdb.f_request_item t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
WHERE s.u_close_code<>t.completion_src_code_c
 ) temp

 
 