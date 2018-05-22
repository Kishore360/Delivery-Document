-- Need to check the first one 

select  'Avg Open to Close Duration (Hours)'as Metric_Name,( sum(open_to_close_duration/3600.00) /count(a.row_key)) as value
from ldb.f_incident_tasks_closed_c a
join   ldb.d_calendar_date  A14
         on   (a. closed_on_c_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11
union
select	'Closed Incident Tasks'as metrics,count(a11.row_key) AS value
from	ldb.f_incident_tasks_closed_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_c_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
union
 SELECT 'Incident Task open to close duration(Secs)' as metrics,(sum(a11.open_to_close_duration) )as value
FROM ldb.f_incident_tasks_closed_c a11
JOIN ldb.d_calendar_date b ON a11.closed_on_c_key=b.row_key
	join	ldb.d_calendar_month	a13
	  on 	(b.month_start_date_key = a13.row_key)
where	 a13.lagging_count_of_month between 0 and 11
union
SELECT 'Opened Incident Tasks' as metrics,count(a.row_key) as value
from ldb.f_incident_tasks_c a 
join ldb.d_calendar_date b 
on a.opened_on_c_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where c.lagging_count_of_month between 0 and 11
