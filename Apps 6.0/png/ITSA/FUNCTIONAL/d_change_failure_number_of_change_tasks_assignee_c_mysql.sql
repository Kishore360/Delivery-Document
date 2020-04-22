select case when count(1)>0 then 'Failure' else 'Success' end as Result,
 case when count(1)>0 then 'Data Mismatch' else 'Success' end as Message
 from png_mdwdb.d_change_failure b 
left join
(select a.change_request,a.sourceinstance,count(distinct a.assigned_to) as assigned_to_count
from png_mdsdb.change_task_final a 
group by a.change_request,sourceinstance) x on x.change_request=b.row_id and b.source_id=x.sourceinstance
where b.current_flag='Y' and b.row_key>0 and b.number_of_change_tasks_assignee_c <> coalesce(x.assigned_to_count,0) ;


