SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (select count(1)cnt from 
(select number,group_concat(u_status),case when group_concat(u_status) like '%1%' then 'Y' 
when group_concat(u_status) like '%2%' then 'Y' else 'N' end action_items_pending_flag_c1 ,action_items_pending_flag_c
-- convert_tz(max(s1.sys_created_on),'GMT','America/Los_Angeles' ) as Due_on,d.action_item_due_date_c due_on_trgt 
from rogersdev_mdsdb.problem_final s
join rogersdev_mdsdb.u_pm_action_items_final s1 on s.sys_id=s1.u_pm_number
-- LEFT JOIN rogersdev_mdwdb.d_lov l on concat('STATE~PROBLEM_TASK~~~',u_status)=row_id
join  rogersdev_mdwdb.d_problem d on s.sys_id=d.row_id and s.sourceinstance=d.source_id
 group by 1
order by 1)a where action_items_pending_flag_c1<>action_items_pending_flag_c  )a;