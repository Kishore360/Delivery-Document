select dr_a.full_name as assigned_to,dr_m.full_name as assigned_to_manager,dr_b.organization_name as assigned_group,
sum(f.reassignment_count) as reassignment_count
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
join #DWH_TABLE_SCHEMA.d_internal_organization dr_b
on f.assignment_group_key=dr_b.row_key
and f.reassignment_count <>0
group by dr_a.full_name,dr_m.full_name,dr_b.organization_name
order by dr_a.full_name,dr_m.full_name,dr_b.organization_name