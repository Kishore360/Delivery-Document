select  b.Protocol Not Followed, count(1) 
from ldb.f_incident a
 inner join ldb.d_incident b
 on a.row_id=b.row_id
 and a.source_id=b.source_id
join	ldb.d_calendar_date	A14
	  on 	(a.opened_on_key = a14.row_key)
	  join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a15.lagging_count_of_month between 0 and 11
group by 1;