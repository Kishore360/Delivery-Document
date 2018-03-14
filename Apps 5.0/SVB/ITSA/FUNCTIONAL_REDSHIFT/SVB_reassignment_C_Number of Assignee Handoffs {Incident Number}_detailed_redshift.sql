select	a11.incident_key AS incident_key,
	max(a14.incident_number) AS incident_number,
	max(a14.reassignee_count) AS WJXBFS1
from	ldb.f_incident_activity	a11
join	ldb.d_calendar_date	a12
on 	(a11.assigned_on_key = a12.row_key)
join	ldb.d_calendar_month	a13
on 	(a12.month_start_date_key = a13.row_key)
join 	ldb.d_incident	a14
on (a11.incident_key=a14.row_key)
where	a13.lagging_count_of_month between 0 and 12
group by	a11.incident_key