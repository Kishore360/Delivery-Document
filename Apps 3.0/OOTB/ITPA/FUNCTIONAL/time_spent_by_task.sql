
/1 time spent on each task1/
select
case when f.task_key='0' then 'UNSPECIFIED' 
when f.task_key='-1' then 'UNKNOWN'
 else dintcon.task_type  end as task_type
,sum(time_spent) as time_spent_on_call

from 	<<tenant>>_mdwdb.f_call	f
join	<<tenant>>_mdwdb.d_call 	d
on f.row_key=d.row_key
join	 <<tenant>>_mdwdb.d_task	dintcon
on dintcon.row_key=f.task_key
group by case when f.task_key='0' then 'UNSPECIFIED' 
when f.task_key='-1' then 'UNKNOWN'
 else dintcon.task_type end
order by case when f.task_key='0' then 'UNSPECIFIED' 
when f.task_key='-1' then 'UNKNOWN'
 else dintcon.task_type  end
