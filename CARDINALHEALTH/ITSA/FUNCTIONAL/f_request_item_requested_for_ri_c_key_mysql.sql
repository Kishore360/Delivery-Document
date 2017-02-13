


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.sc_req_item_final a
join cardinalhealth_mdwdb.f_request_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join cardinalhealth_mdwdb.d_internal_contact c
on c.row_id=COALESCE(CONCAT('INTERNAL_CONTACT','~',a.u_requested_for),'UNSPECIFIED') 
and c.source_id=a.sourceinstance
where COALESCE(c.row_key,CASE WHEN a.u_requested_for IS NULL THEN 0 else -1 end)<>b.requested_for_ri_c_key;



