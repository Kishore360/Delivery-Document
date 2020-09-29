select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_change_task.configuration_item_c_key' ELSE 'SUCCESS' END as Message  from fidelity_mdsdb.change_task_final src 
left join fidelity_mdwdb.d_change_task trg on trg.row_id=src.sys_id
left join fidelity_mdwdb.d_configuration_item  lkp on trg.configuration_item_c_key=lkp.row_key
where src.cmdb_ci<>lkp.row_id and src.cdctype<>'D';
