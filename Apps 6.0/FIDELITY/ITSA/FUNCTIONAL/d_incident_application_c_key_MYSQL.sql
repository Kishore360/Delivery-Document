select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_problem_task.configuration_item_c_key' ELSE 'SUCCESS' END as Message  
from fidelity_mdsdb.incident_final src 
left join fidelity_mdwdb.d_incident trg on trg.row_id=src.sys_id
left join fidelity_mdwdb.d_application  lkp on trg.application_c_key=lkp.row_key
where case when lkp.row_key <0  then 'UNKNOWN' else CONCAT('APPLICATION~',src.cmdb_ci) end<>COALESCE(lkp.row_id,'UNSPECIFIED') and src.cdctype<>'D';
