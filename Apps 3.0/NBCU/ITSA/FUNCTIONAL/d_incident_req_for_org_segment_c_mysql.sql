SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
nbcu_mdwdb.d_incident a
join nbcu_mdsdb.incident_final b
ON a.row_id=b.sys_id
AND a.source_id=b.sourceinstance
where b.u_req_for_org_segment<>a.req_for_org_segment_c;