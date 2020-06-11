select	a13.opened_by_department AS opened_by_department,
	count(a11.row_key) AS unassigned_request_tasks
from	#DWH_TABLE_SCHEMA.f_request_task	a11
	join	#DWH_TABLE_SCHEMA.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	#DWH_TABLE_SCHEMA.d_request	a13
	  on 	(a11.request_key = a13.row_key)
	where	a12.lagging_count_of_month between 0 and 12
group by	a13.opened_by_department 
order by  a13.opened_by_department 

