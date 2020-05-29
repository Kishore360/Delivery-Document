select dr.opened_by_department as REQ_Opened_By_Department,dr.opened_by as REQ_Opened_By, dr.requested_for_department as REQ_Requested_For_Department,
dr.requested_for_location as REQ_Requested_For_Location, dr.requested_for as REQ_Requested_For, dr.opened_by_location as REQ_Opened_By_Location,
count(1) as opened_request_task
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
group by dr.opened_by_department,dr.opened_by,dr.requested_for_department,dr.requested_for_location,dr.requested_for,dr.opened_by_location
order by dr.opened_by_department,dr.opened_by,dr.requested_for_department,dr.requested_for_location,dr.requested_for,dr.opened_by_location
