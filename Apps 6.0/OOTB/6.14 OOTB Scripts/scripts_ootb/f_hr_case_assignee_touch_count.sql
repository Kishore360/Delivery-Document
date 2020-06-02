
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for assignee_touch_count' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.f_hr_case TRGTF
left join (select count(touch) as assignee_touch_count,row_key from 
		(select DISTINCT task_attribute_wh_new_value_key as touch,D.row_key
		from #DWH_TABLE_SCHEMA.f_hr_case_activity T
		join  #DWH_TABLE_SCHEMA.d_hr_case D
		on (T.task_key= D.row_key and T.task_wh_type='hr_case' and T.task_attribute_wh_name ='assigned_to') 
        where task_attribute_wh_new_value_key<>0
		union
		select DISTINCT task_attribute_wh_old_value_key as touch,D.row_key
		from #DWH_TABLE_SCHEMA.f_hr_case_activity T
		join  #DWH_TABLE_SCHEMA.d_hr_case D
		on (T.task_key= D.row_key and T.task_wh_type='hr_case' and T.task_attribute_wh_name ='assigned_to')
        where task_attribute_wh_old_value_key <>0
        union
        select DISTINCT assigned_to_key as touch,F.hr_case_key
		from  #DWH_TABLE_SCHEMA.f_hr_case F
        where assigned_to_key <>0
        ) distincttouch
        group by row_key
) cnt 
on TRGTF.hr_case_key=cnt.row_key
where TRGTF.soft_deleted_flag = 'N' 
and coalesce(cnt.assignee_touch_count,0)<>coalesce(TRGTF.assignee_touch_count,'')  