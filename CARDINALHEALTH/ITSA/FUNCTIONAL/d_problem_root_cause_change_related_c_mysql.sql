SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.problem_final a
join cardinalhealth_mdwdb.d_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where case when a.u_root_cause_change_related ='' then '' else (case when a.u_root_cause_change_related='Yes' then 'Y' else 'N' end) end 
<>b.root_cause_change_related_c_flag;