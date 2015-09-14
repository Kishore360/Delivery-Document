SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from aruba_mdsdb.sc_req_item_final a
 join aruba_mdwdb.f_request_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join aruba_mdsdb.sc_request_final x
on x.sys_id=a.request and x.sourceinstance=b.source_id 
left join aruba_mdwdb.d_calendar_date c
on DATE_FORMAT(CONVERT_TZ(x.u_new_hire_start_date,'GMT','America/Los_Angeles'),'%Y%m%d') =c.row_id 
where c.row_key<>b.new_hire_start_c_key;