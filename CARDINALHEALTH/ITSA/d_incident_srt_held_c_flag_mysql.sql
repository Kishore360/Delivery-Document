SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.incident_delta a
left join cardinalhealth_mdwdb.d_incident b
on a.sys_id=b.row_id and b.source_id=a.sourceinstance
where b.srt_held_c_flag<>case when coalesce(a.u_srt_held,0)=1 then 'Y' else 'N' end;
