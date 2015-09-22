SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from aruba_mdsdb.sc_req_item_final a
join aruba_mdwdb.d_request_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join aruba_mdsdb.sc_request_final c
on c.sys_id=a.request and a.sourceinstance=c.sourceinstance
where b.new_hire_start_date_c <>c.u_new_hire_start_date ;