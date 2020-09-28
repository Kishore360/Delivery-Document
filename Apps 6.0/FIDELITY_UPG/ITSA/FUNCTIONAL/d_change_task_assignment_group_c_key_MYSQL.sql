select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_change_task.assignment_group_c_key' ELSE 'SUCCESS' END as Message 
from fidelity_mdsdb.change_task_final src 
left join fidelity_mdwdb.d_change_task trg on trg.row_id=src.sys_id
left join fidelity_mdwdb.d_internal_organization  lkp 
on concat('GROUP~',src.assignment_group) =lkp.row_id
where coalesce(lkp.row_key, case when  src.assignment_group is null then 0 else -1 end )<> trg.assignment_group_c_key
and  src.cdctype<>'D';



