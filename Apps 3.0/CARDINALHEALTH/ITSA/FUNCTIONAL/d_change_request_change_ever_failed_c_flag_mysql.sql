SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
 select count(1) cnt
from cardinalhealth_mdsdb.sys_audit_final a
 left  JOIN  cardinalhealth_mdwdb.f_t_task_activity b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
join cardinalhealth_mdwdb.d_change_request d
on a.documentkey=d.row_key
 where  a.tablename = 'change_request' and  
case when a.fieldname = 'u_success_status' and b.task_key <> -1 
and task_attribute_wh_old_value='Failed' or task_attribute_wh_new_value='Failed' then 'Y' 
    else 'N' end

 <> d.change_ever_failed_c_flag  )b
 
 