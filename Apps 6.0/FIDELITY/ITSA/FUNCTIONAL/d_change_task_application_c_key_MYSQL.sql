select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_problem_task.configuration_item_c_key' ELSE 'SUCCESS' END as Message  
from fidelity_mdsdb.change_task_final src 
join fidelity_mdwdb.d_change_task trg on trg.row_id=src.sys_id
join fidelity_mdwdb.d_application  lkp 
on CONCAT('APPLICATION~',src.cmdb_ci)=lkp.row_id
where coalesce(lkp.row_key, case when src.cmdb_ci is null then 0 else -1 end)<>trg.application_c_key and src.cdctype<>'D';
