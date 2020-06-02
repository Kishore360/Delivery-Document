select
dintorg.organization_name,percent_task.dimension_name
,coalesce(tas.dimension_name,'UNSPECIFIED') as dim
,concat(
(round(cast(count(f.row_key)as numeric) 
/max(case when percent_task.reported_type_src_key is not null then percent_task.task_type_cnt else 0 end  )*100)):: integer 
,'%')  as task_type_per
--,count(f.row_key)as numeric
from 

#DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
and f.soft_deleted_flag<>'Y'

join	#DWH_TABLE_SCHEMA.d_calendar_date 	dt
on f.opened_on_key=dt.row_key
and dt.lagging_count_of_month between 0 and 11
/*
left join	ldb.d_task 	tas
on f.task_key=tas.row_key*/
join	#DWH_TABLE_SCHEMA.d_internal_organization	dintorg
on dintorg.row_key=f.department_key
left join
(
select	--dintorg.organization_name,
f.reported_type_src_key,
case when f.reported_type_src_key='0' then 'UNSPECIFIED'
when f.reported_type_src_key='-1' then 'UNKNOWN'
 ELSE d_lov.dimension_name END AS DIMENSION_NAME
,count(f.row_key) as task_type_cnt from
#DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
and f.soft_deleted_flag<>'Y'

join	#DWH_TABLE_SCHEMA.d_calendar_date 	dt
on f.opened_on_key=dt.row_key
and dt.lagging_count_of_month between 0 and 11

inner join #DWH_TABLE_SCHEMA.d_lov	d_lov
on d_lov.row_key=f.reported_type_src_key
--join	#DWH_TABLE_SCHEMA.d_internal_organization	dintorg
--on dintorg.row_key=f.department_key
group by	--dintorg.organization_name,
f.reported_type_src_key
,d_lov.dimension_name
)percent_task
on percent_task.reported_type_src_key=f.reported_type_src_key
join	
(select tas.row_key,tas.task_type_src_key,tas.task_type_src_code
,d.dimension_name,dimension_class from
#DWH_TABLE_SCHEMA.d_task 	tas
left join #DWH_TABLE_SCHEMA.d_lov d
on tas.task_type_src_key=d.row_key
and d.dimension_class ='TASK_TYPE~TASK'
)tas
on f.task_key=tas.row_key
group by dintorg.organization_name
,percent_task.dimension_name
 ,tas.dimension_name
order by dintorg.organization_name
,percent_task.dimension_name

-- ,case when tas.task_type='UNSPECIFIED' then 'zzz' else 
,lower(tas.dimension_name) -- end

