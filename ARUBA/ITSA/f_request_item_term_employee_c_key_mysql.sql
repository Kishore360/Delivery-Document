SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from aruba_mdsdb.sc_req_item_final a
left join aruba_mdwdb.f_request_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join aruba_mdsdb.sc_request_final x
on x.sys_id=a.request and x.sourceinstance=b.source_id
left join aruba_mdwdb.d_internal_contact c
on c.row_id=COALESCE(CONCAT('INTERNAL_CONTACT~',x.u_term_employee_name),'UNSPECIFIED') and a.sourceinstance=c.source_id
where c.row_key<>b.term_employee_c_key;