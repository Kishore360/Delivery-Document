SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_problem.multiple_assignment_flag' ELSE 'SUCCESS' END as Message
 FROM (
select count(1) cnt
from 
(select sys_id,sourceinstance,documentkey,newvalue,CONCAT('INTERNAL_CONTACT~',newvalue) as lkp_row_id
from tjx_mdsdb.sys_audit_final 
where
tablename = 'problem' and fieldname = 'assigned_to') src
left join 
(select row_id,source_id,task_key,task_attribute_wh_new_value,task_attribute_wh_new_value_key
from tjx_mdwdb.f_t_task_activity where task_wh_type = 'problem' and task_attribute_wh_name = 'assigned_to') trgt on src.sys_id = trgt.row_id 
left join tjx_mdwdb.d_internal_contact lkp on lkp.source_id = src.sourceinstance and lkp.row_id = src.lkp_row_id 
where COALESCE(lkp.row_key,CASE WHEN src.newvalue IS NULL THEN 0 else -1 end) <> (trgt.task_attribute_wh_new_value_key))b;