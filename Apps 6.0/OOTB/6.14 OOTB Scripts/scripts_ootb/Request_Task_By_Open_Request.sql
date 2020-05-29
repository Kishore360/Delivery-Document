select di.request_item_number as Request_Item, d.request_task_number as Request_Task, d.request_task_number as Request_Task_Number,
dl.location_name as Request_Task_Location,max(d.short_description) as Short_Description, lov_state.dimension_name as state,
count(1) as opened_request_task
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
group by di.request_item_number,d.request_task_number,d.request_task_number, dl.location_name,d.short_description,lov_state.dimension_name
order by  di.request_item_number,d.request_task_number,d.request_task_number, dl.location_name,d.short_description,lov_state.dimension_name