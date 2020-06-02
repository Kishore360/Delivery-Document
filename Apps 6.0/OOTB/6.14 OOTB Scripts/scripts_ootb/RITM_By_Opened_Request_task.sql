select di.opened_by_location as RITM_Opened_By_Location, di.requested_for_location as RITM_Requested_For_Location, di.requested_for as RITM_Requested_For, 
di.opened_by as RITM_Opened_By, di.opened_by_department as RITM_Opened_By_Department,
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
group by di.opened_by_location,di.requested_for_location,di.requested_for, di.opened_by,di.opened_by_department
order by di.opened_by_location,di.requested_for_location,di.requested_for, di.opened_by,di.opened_by_department