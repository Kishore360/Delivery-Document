SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message

from molinahealth_mdsdb.sc_req_item_final a
join molinahealth_mdwdb.f_request_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
LEFT JOIN molinahealth_mdwdb.d_change_request c
ON a.u_change_number=c.row_id
AND c.source_id=a.sourceinstance
where coalesce(c.row_key,case when a.u_change_number is null then 0 else -1 end )<>change_c_key