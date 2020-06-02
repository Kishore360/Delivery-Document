/* No of calls made by each task*/
select
case when f.task_key='0' then 'UNKNOWN' 
when f.task_key='-1' then 'UNSPECIFIED'
 else dintcon.task_type  end as task_type
,count(1)

from 	#DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
join	 #DWH_TABLE_SCHEMA.d_task	dintcon
on dintcon.row_key=f.task_key
group by 
case when f.task_key='0' then 'UNKNOWN' 
when f.task_key='-1' then 'UNSPECIFIED'
 else dintcon.task_type  end 
order by case when f.task_key='0' then 'UNKNOWN' 
when f.task_key='-1' then 'UNSPECIFIED'
 else dintcon.task_type  end
;
