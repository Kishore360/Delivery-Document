select  a.Source_Dimension_Name  , count(1)
from ldb.d_hold_reason_c a  
inner join ldb.f_incident b
on b.hold_reason_c_key=a.row_key
join	ldb.d_calendar_date	A14
	  on 	(b.opened_on_key = a14.row_key)
	  join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a15.lagging_count_of_month between 0 and 11
group by 1;



select  a.Source_Dimension_Name  , count(1)
from ldb.d_hold_reason_c a  
inner join ldb.f_incident_closed b
on b.hold_reason_c_key=a.row_key
join	ldb.d_calendar_date	A14
	  on 	(b.closed_on_key = a14.row_key)
	  join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a15.lagging_count_of_month between 0 and 11
group by 1;



select  a.Source_Dimension_Name  , count(1)
from ldb.d_hold_reason_c a  
inner join ldb.f_incident_resolved b
on b.hold_reason_c_key=a.row_key
join	ldb.d_calendar_date	A14
	  on 	(b.resolved_on_key = a14.row_key)
	  join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a15.lagging_count_of_month between 0 and 11
group by 1;
