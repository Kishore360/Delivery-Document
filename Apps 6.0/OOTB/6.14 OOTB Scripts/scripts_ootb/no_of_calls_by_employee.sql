
/* No of calls made by each emplyoee*/
select
dintcon.full_name
,count(1) as num_of_calls

from 	#DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
join	 #DWH_TABLE_SCHEMA.d_internal_contact	dintcon
on dintcon.row_key=f.opened_by_key
group by dintcon.full_name
order by dintcon.full_name
;