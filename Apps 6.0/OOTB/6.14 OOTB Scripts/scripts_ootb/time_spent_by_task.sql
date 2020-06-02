
/* time spent on each task*/
select
case when f.task_key='0' then 'UNSPECIFIED' 
when f.task_key='-1' then 'UNKNOWN'
 else dintcon.task_type  end as task_type
,sum(time_spent) as time_spent_on_call

from 	#DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
join	 #DWH_TABLE_SCHEMA.d_task	dintcon
on dintcon.row_key=f.task_key
group by case when f.task_key='0' then 'UNSPECIFIED' 
when f.task_key='-1' then 'UNKNOWN'
 else dintcon.task_type end
order by case when f.task_key='0' then 'UNSPECIFIED' 
when f.task_key='-1' then 'UNKNOWN'
 else dintcon.task_type  end
