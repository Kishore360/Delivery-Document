/1 No of calls made by each location1/
select
dintcon.location_name as location
,count(1) as num_of_calls

from 	<<tenant>>_mdwdb.f_call	f
join	<<tenant>>_mdwdb.d_call 	d
on f.row_key=d.row_key
join	 <<tenant>>_mdwdb.d_location	dintcon
on dintcon.row_key=f.location_key
group by dintcon.location_name
order by dintcon.location_name
;
