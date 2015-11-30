SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.change_request a
join cardinalhealth_mdwdb.f_change_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.deployment_reason_src_code_c <> a.u_deployment_reason;