SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

mercury_mdsdb.problem_final a
join mercury_mdwdb.d_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id and a.cdctype<>'D'
left join mercury_mdwdb.d_lov c
on CONCAT('OUTAGE_SCOPE~PROBLEM~',a.u_outage_scope)=c.src_rowid
and c.current_flag='Y'
where coalesce(c.row_key,case when a.u_outage_scope is null then  0 else -1 end )<>b.outage_scope_c_key
