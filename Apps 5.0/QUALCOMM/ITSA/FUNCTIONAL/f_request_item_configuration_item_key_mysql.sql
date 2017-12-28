SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

qualcomm_mdsdb.sc_req_item_final a
join qualcomm_mdwdb.f_request_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join qualcomm_mdwdb.d_configuration_item c
on a.sourceinstance=c.source_id and c.row_id=coalesce(a.cmdb_ci,'UNSPECIFIED')
where c.row_key<>b.configuration_item_key;
