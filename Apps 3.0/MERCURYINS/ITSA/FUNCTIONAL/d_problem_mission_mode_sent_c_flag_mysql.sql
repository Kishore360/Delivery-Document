SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

mercuryins_mdsdb.problem_final a
join mercuryins_mdwdb.d_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.mission_mode_sent_c_flag<> case when a.u_mission_mode_sent='0' then 'N' else 'Y' end;