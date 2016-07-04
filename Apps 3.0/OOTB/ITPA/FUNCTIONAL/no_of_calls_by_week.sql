/1 No of calls by each week1/
select
dintorg.week_name  as week
,count(1) as no_of_calls

from <<tenant>>_mdwdb.f_call	f
join	<<tenant>>_mdwdb.d_call 	d
on f.row_key=d.row_key
join	 <<tenant>>_mdwdb.d_calendar_date	dintorg
on dintorg.row_key=f.opened_on_key
and dintorg.week_start_date_key between dintorg.month_start_date_key and dintorg.month_end_date_key
group by dintorg.week_name
order by dintorg.week_name
;
