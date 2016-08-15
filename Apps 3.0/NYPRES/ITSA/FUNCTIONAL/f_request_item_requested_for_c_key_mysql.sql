SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
nypres_mdsdb.request_item_final a
join nypres_mdwdb.f_request_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join nypres_mdwdb.d_internal_contact c
on COALESCE(CONCAT('INTERNAL_CONTACT','~',a.u_requested_for),'UNSPECIFIED')=c.row_id and a.sourceinstance=c.source_id
where coalesce(c.row_key,case when u_requested_for is null then 0 else -1 end )<>b.requested_for_c_key;

