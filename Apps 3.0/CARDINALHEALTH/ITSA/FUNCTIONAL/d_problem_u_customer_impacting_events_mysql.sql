SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.problem_final a
left join cardinalhealth_mdwdb.d_problem b
on a.sys_id=b.row_id and b.source_id=a.sourceinstance
where b.customer_impacting_event_c_flag
<>case when coalesce(a.u_customer_impacting_events,0)=1 then 'Y' else 'N' end;


