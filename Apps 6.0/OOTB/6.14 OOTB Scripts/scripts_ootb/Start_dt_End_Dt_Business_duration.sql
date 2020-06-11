select d.work_start_on as Actual_Start_Date, d.work_end_on as Actual_End_Date,ci.name as Affcted_CI, dr.request_number as Request_Number, 
(sum(f.business_duration / 86400.0)) as Business_Days
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
join #DWH_TABLE_SCHEMA.d_internal_contact dr_a
on f.assigned_to_key=dr_a.row_key
join #DWH_TABLE_SCHEMA.d_internal_contact dr_m
on dr_a.manager_key=dr_m.row_key
group by d.work_start_on,d.work_end_on,ci.name,dr.request_number
order by  d.work_start_on,d.work_end_on,ci.name,dr.request_number