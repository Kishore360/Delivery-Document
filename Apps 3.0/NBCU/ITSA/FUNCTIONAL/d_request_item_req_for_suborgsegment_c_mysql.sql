SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
nbcu_mdwdb.d_request_item a
join nbcu_mdsdb.sc_req_item_final b
ON a.row_id=b.sys_id
AND a.source_id=b.sourceinstance
where b.u_req_for_suborgsegment<>a.req_for_suborgsegment_c;