
/* No of calls by each year & week*/
select
dintorg.year_name 
,dintorg.month_name 
,count(1) as no_of_calls

from #DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
join	 #DWH_TABLE_SCHEMA.d_calendar_date	dintorg
on dintorg.row_key=f.opened_on_key

group by dintorg.year_name ,
dintorg.month_name 

order by dintorg.year_name ,
dintorg.month_name 
;
