SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_problem.multiple_assignment_flag' ELSE 'SUCCESS' END as Message
 FROM (
select count(1) cnt
from 
(select sys_id,sourceinstance,oldvalue,CONCAT('INTERNAL_CONTACT~',oldvalue) as lkp_row_id
from cardinalhealth_mdsdb.sys_audit_final 
where
tablename = 'enhancement' ) src
left join 
(select row_id,source_id,task_attribute_wh_old_value,task_attribute_wh_old_value_key
from cardinalhealth_mdwdb.f_rm_activity_c where task_wh_type = 'enhancement' ) trgt on src.sys_id = trgt.row_id 
left join cardinalhealth_mdwdb.d_internal_contact lkp on lkp.source_id = src.sourceinstance and lkp.row_id = src.lkp_row_id 
where COALESCE(lkp.row_key,CASE WHEN src.oldvalue IS NULL THEN 0 else -1 end) <> (trgt.task_attribute_wh_old_value_key))b;