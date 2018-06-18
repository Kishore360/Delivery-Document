SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
pan6_mdsdb.u_service_request_final a
join pan6_mdwdb.d_service_request_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.last_resolved_on<> CONVERT_TZ(a.u_resolved_at,'GMT','America/Los_Angeles');