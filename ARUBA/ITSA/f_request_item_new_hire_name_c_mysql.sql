SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from aruba_mdsdb.sc_req_item_final a
left join aruba_mdwdb.f_request_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join aruba_mdsdb.sc_request_final x
on x.sys_id=a.request and x.sourceinstance=b.source_id
where b.new_hire_name_c<>x.u_new_hire_name;