select dr.opened_by_department AS opened_by_department,
dr.opened_by_location AS opened_by_location,
sum((f.open_to_close_duration / 86400.0)) AS Avg_Open_To_Close_Duration
from #DWH_TABLE_SCHEMA.f_request_task f
join #DWH_TABLE_SCHEMA.d_request_task d
on f.request_task_key=d.row_key
and f.soft_deleted_flag<>'Y'
and d.soft_deleted_flag<>'Y'
join #DWH_TABLE_SCHEMA.d_request dr
on f.request_key=dr.row_key
join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on f.opened_on_key=dcd.row_key
and dcd.lagging_count_of_month between 0 and 12
group by dr.opened_by_department,dr.opened_by_location
order by dr.opened_by_department,dr.opened_by_location
