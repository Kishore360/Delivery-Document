SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

paloalto_mdsdb.u_service_request_final a
join paloalto_mdwdb.d_service_request_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.reasignment_count<> a.reassignment_count;