/1 No of calls made by each caller1/
select
dintcon.full_name as caller_name
,count(1) as num_of_times_called

from 	<<tenant>>_mdwdb.f_call	f
join	<<tenant>>_mdwdb.d_call 	d
on f.row_key=d.row_key
join	 <<tenant>>_mdwdb.d_internal_contact	dintcon
on dintcon.row_key=f.caller_key
group by dintcon.full_name
order by dintcon.full_name
;
