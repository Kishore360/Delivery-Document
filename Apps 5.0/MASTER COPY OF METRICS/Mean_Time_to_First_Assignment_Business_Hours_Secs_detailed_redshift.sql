select	sum(a11.time_to_assign_business_hr_c) AS Mean_Time_to_First_Assignment_Business_Hours_Secs
	count(a11.row_key) AS WJXBFS2
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11