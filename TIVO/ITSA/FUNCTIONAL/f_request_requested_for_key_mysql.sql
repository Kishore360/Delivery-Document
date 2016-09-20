SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message

from tivo_mdsdb.sc_req_item_final a
join tivo_mdwdb.f_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
LEFT JOIN  tivo_mdwdb.d_internal_contact c
ON concat('INTERNAL_CONTACT~',a.u_request_for)=c.row_id
AND c.source_id=a.sourceinstance
where coalesce(c.row_key,case when a.u_request_for is null then 0 else -1 end)<>requested_for_key
