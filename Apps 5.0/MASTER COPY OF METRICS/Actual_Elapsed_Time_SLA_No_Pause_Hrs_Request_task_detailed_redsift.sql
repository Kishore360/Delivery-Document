
select	sum((a11.met_sla_without_pause_duration_c / 3600.0)) AS Actual_Elapsed_Time_SLA_No_Pause_Hrs
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11