/* No of calls made by each caller*/
select
dintcon.full_name as caller_name
,count(1) as num_of_times_called

from 	#DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
join	 #DWH_TABLE_SCHEMA.d_internal_contact	dintcon
on dintcon.row_key=f.caller_key
group by dintcon.full_name
order by dintcon.full_name
;
