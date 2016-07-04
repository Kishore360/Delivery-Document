
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for assignee_touch_count' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_hr_case TRGTF
left join
(select COUNT (DISTINCT task_attribute_wh_old_value,task_attribute_wh_new_value) 
D.row_key, count(1) as assignee_touch_count
 from <<tenant>>_mdwdb.f_hr_case_activity T
join  <<tenant>>_mdwdb.d_hr_case D
on (T.task_key= D.row_key
                                and T.task_wh_type='hr_case'
                                and T.task_attribute_wh_name ='assigned_to'
                               and T.task_attribute_wh_old_value is not null 
							   and  T.task_attribute_wh_new_value is not null
) 
group by D.row_key
) cnt 
on TRGTF.hr_case_key=cnt.row_key
where TRGTF.soft_deleted_flag = 'N' and TRGTF.row_key not in (0,-1) and
coalesce(cnt.assignee_touch_count,0)<>coalesce(TRGTF.assignee_touch_count,'')  
