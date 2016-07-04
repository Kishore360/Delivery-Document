/1 No of calls made by each task1/
select
case when f.task_key='0' then 'UNKNOWN' 
when f.task_key='-1' then 'UNSPECIFIED'
 else dintcon.task_type  end as task_type
,count(1)

from 	<<tenant>>_mdwdb.f_call	f
join	<<tenant>>_mdwdb.d_call 	d
on f.row_key=d.row_key
join	 <<tenant>>_mdwdb.d_task	dintcon
on dintcon.row_key=f.task_key
group by 
case when f.task_key='0' then 'UNKNOWN' 
when f.task_key='-1' then 'UNSPECIFIED'
 else dintcon.task_type  end 
order by case when f.task_key='0' then 'UNKNOWN' 
when f.task_key='-1' then 'UNSPECIFIED'
 else dintcon.task_type  end
;
