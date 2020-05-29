select
dintorg.organization_name
,lo_type.dimension_name
--,count(f.row_key) 
--,sum(percent_task.task_type_cnt ) as task_type
--,max(case when percent_task.task_type_cnt is not null then percent_task.task_type_cnt else 0 end  )
,concat(
(round(cast(count(f.row_key)as numeric) 
/max(case when percent_task.task_type_cnt is not null then percent_task.task_type_cnt else 0 end  )*100)):: integer 
,'%')  as task_type_per
from 

#DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
and f.soft_deleted_flag<>'Y'

join	#DWH_TABLE_SCHEMA.d_calendar_date 	dt
on f.opened_on_key=dt.row_key
and dt.lagging_count_of_month between 0 and 11

left join	#DWH_TABLE_SCHEMA.d_task 	tas
on f.task_key=tas.row_key
join	#DWH_TABLE_SCHEMA.d_internal_organization	dintorg
on dintorg.row_key=f.department_key

inner join
(
select lo.* from 
#DWH_TABLE_SCHEMA.d_lov lo
where 
(lo.dimension_class::text = 'TASK_TYPE~TASK'::text 
) or
( lo.row_key in (0,-1))
 )lo_type
 on lo_type.row_key=tas.task_type_src_key
left join
(
select	--dintorg.organization_name,
lo_type.dimension_name as task_type,
count(f.row_key) as task_type_cnt from
#DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
and f.soft_deleted_flag<>'Y'

join	#DWH_TABLE_SCHEMA.d_calendar_date 	dt
on f.opened_on_key=dt.row_key
and dt.lagging_count_of_month between 0 and 11

join	#DWH_TABLE_SCHEMA.d_task 	tas
on f.task_key=tas.row_key

inner join
(
select lo.* from 
#DWH_TABLE_SCHEMA.d_lov lo
where 
(lo.dimension_class::text = 'TASK_TYPE~TASK'::text 
) or
( lo.row_key in (0,-1))
 )lo_type
 on lo_type.row_key=tas.task_type_src_key
--join	#DWH_TABLE_SCHEMA.d_internal_organization	dintorg
--on dintorg.row_key=f.department_key
group by	--dintorg.organization_name,
lo_type.dimension_name
)percent_task
on percent_task.task_type=lo_type.dimension_name

group by dintorg.organization_name
,lo_type.dimension_name
order by dintorg.organization_name
-- ,case when tas.task_type='UNSPECIFIED' then 'zzz' else 
,lower(lo_type.dimension_name) -- end

