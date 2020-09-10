select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_problem_task.assignment_group_c_key' ELSE 'SUCCESS' END as Message  
from fidelity_mdsdb.problem_task_final src 
left join fidelity_mdwdb.d_problem_task trg on trg.row_id=src.sys_id
left join fidelity_mdwdb.d_internal_organization  lkp on trg.assignment_group_c_key=lkp.row_key
where case when lkp.row_key<0 then 'UNKNOWN' else concat('GROUP~',src.assignment_group) end<>lkp.row_id and src.cdctype<>'D';



