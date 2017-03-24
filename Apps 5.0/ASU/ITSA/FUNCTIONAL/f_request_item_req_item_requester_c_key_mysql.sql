SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from asu_mdsdb.sc_req_item_final s
left join asu_mdwdb.f_request_item   t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
LEFT JOIN asu_mdwdb.d_internal_contact l 
 ON ( concat('INTERNAL_CONTACT~',s.u_requester)= l.row_id 
AND s.sourceinstance= l.source_id )
WHERE t.req_item_requester_c_key <> l.row_key
) temp