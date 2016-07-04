
/1 No of calls by each year & week1/
select
dintorg.year_name 
,dintorg.month_name 
,count(1) as no_of_calls

from <<tenant>>_mdwdb.f_call	f
join	<<tenant>>_mdwdb.d_call 	d
on f.row_key=d.row_key
join	 <<tenant>>_mdwdb.d_calendar_date	dintorg
on dintorg.row_key=f.opened_on_key

group by dintorg.year_name ,
dintorg.month_name 

order by dintorg.year_name ,
dintorg.month_name 
;
