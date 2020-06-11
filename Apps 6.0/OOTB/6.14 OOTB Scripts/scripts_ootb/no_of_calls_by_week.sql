/* No of calls by each week*/
select
dintorg.week_name  as week
,count(1) as no_of_calls

from #DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
join	 #DWH_TABLE_SCHEMA.d_calendar_date	dintorg
on dintorg.row_key=f.opened_on_key
and dintorg.week_start_date_key between dintorg.month_start_date_key and dintorg.month_end_date_key
group by dintorg.week_name
order by dintorg.week_name
;
