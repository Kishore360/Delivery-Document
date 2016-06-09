SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

mercuryinsurance_mdsdb.problem_final a
join mercuryinsurance_mdwdb.d_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.incident_manager_notified_c_flag<> case when a.u_incident_manager_notified='0' then 'N' else 'Y' end;