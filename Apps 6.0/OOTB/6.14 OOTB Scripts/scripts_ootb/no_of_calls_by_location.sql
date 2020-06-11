/* No of calls made by each location*/
select
dintcon.location_name as location
,count(1) as num_of_calls

from 	#DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
join	 #DWH_TABLE_SCHEMA.d_location	dintcon
on dintcon.row_key=f.location_key
group by dintcon.location_name
order by dintcon.location_name
;
