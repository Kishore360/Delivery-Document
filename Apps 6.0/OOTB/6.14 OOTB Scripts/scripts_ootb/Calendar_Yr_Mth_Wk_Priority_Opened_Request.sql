select dr.opened_by_department as REQ_Opened_By_Department, dcd.year_id as Calendar_Year,(dcd.month_name_abbreviated||' '||dcd.year_id) as Calendar_month,
(dcd.month_name_abbreviated||' '||substring(dcd.week_start_date_of_month_key,7,2)) as Calendar_Week, lov_priority.dimension_name as Priority,count(1) as Opened_Request_Tasks
from #DWH_TABLE_SCHEMA.f_request_task f
join #DWH_TABLE_SCHEMA.d_request_task d
on f.request_task_key=d.row_key
and f.soft_deleted_flag<>'Y'
and d.soft_deleted_flag<>'Y'
join #DWH_TABLE_SCHEMA.d_request dr
on f.request_key=dr.row_key
join #DWH_TABLE_SCHEMA.d_request_item di
on f.request_item_key=di.row_key
join #DWH_TABLE_SCHEMA.d_location dl
on f.location_key=dl.row_key
join #DWH_TABLE_SCHEMA.d_configuration_item ci
on f.configuration_item_key=ci.row_key
join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on f.opened_on_key=dcd.row_key
and dcd.lagging_count_of_month between 0 and 12
join 
(select dl.* from
#DWH_TABLE_SCHEMA.d_lov dl
where dimension_class='STATE~SC_TASK'
union
select dl.* from
#DWH_TABLE_SCHEMA.d_lov dl
where row_key in (0,-1)
) lov_state
on f.state_src_key=lov_state.row_key
join 
(select d2.* from
#DWH_TABLE_SCHEMA.d_lov d2
where dimension_class='PRIORITY~SC_TASK'
union
select d2.* from
#DWH_TABLE_SCHEMA.d_lov d2
where row_key in (0,-1)
) lov_priority
on f.priority_src_key=lov_priority.row_key
join #DWH_TABLE_SCHEMA.d_internal_contact dr_a
on f.assigned_to_key=dr_a.row_key
join #DWH_TABLE_SCHEMA.d_internal_contact dr_m
on dr_a.manager_key=dr_m.row_key
group by dr.opened_by_department,dcd.year_id,(dcd.month_name_abbreviated||' '||dcd.year_id),(dcd.month_name_abbreviated||' '||substring(dcd.week_start_date_of_month_key,7,2)),lov_priority.dimension_name
order by  dr.opened_by_department,dcd.year_id,(dcd.month_name_abbreviated||' '||dcd.year_id),(dcd.month_name_abbreviated||' '||substring(dcd.week_start_date_of_month_key,7,2)),lov_priority.dimension_name,Opened_Request_Tasks