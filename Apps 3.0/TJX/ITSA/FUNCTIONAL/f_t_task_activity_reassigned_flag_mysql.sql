
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
 select count(1) cnt
from tjx_mdsdb.sys_audit_final a
 left  JOIN  tjx_mdwdb.f_t_task_activity b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
 where  a.tablename = 'problem' and  
case when a.fieldname = 'assignment_group' and task_attribute_wh_old_value is not null and task_attribute_wh_new_value  is not null then 'Y' 
    when  a.fieldname = 'assigned_to' and task_attribute_wh_old_value is not null and task_attribute_wh_new_value is not null then 'Y' else 'N' end

 <> b.reassigned_flag  )b
 
 