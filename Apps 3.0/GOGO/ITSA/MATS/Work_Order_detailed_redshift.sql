select'f_work_order_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c             a11 
 union
select'd_work_order_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_work_order_c         a12
on (a11.work_order_c_key = a12.row_key)
union
select'd_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_internal_organization_legalentity         a12
on (a11.company_key = a12.row_key)
Union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_internal_contact         a12
on (a11.opened_by_key = a12.row_key)
union
select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_internal_contact         a12
on (a11.assigned_to_key = a12.row_key)
union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_internal_contact         a12
on (a11.assigned_to_key = a12.row_key)
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_internal_organization_group         a12
on (a11.assignment_group_key = a12.row_key)
union
select'd_configuration_item' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_configuration_item         a12
on (a11.configuration_item_key = a12.row_key)
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
 join          ldb.d_internal_contact            a14
                  on          (a11.opened_by_key = a14.row_key)
join ldb.d_internal_contact_mdm         a12
on (a14.row_current_key = a12.row_key)
union
select'd_internal_organization_qualification_group_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_internal_organization_qualification_group_c         a12
on (a11.qualification_group_key = a12.row_key)
union
select'd_internal_contact_requested_for' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_internal_contact_requested_for         a12
on (a11.requested_by_key = a12.row_key)
union
select'd_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_internal_contact_task_closed_by         a12
on (a11.closed_by_key = a12.row_key)
union
select'd_task_wm_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_task_wm_c         a12
on (a11.initiated_task_key = a12.row_key)
union
select'd_location' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_location         a12
on (a11.location_key = a12.row_key)
union
select'd_location' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_location         a12
on (a11.location_key = a12.row_key)
union
select'd_work_order_priority_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_work_order_priority_c         a12
on (a11.priority_src_key = a12.row_key)
union
select'd_work_order_state_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join  ldb.d_work_order_state_c         a12
on (a11.state_src_key = a12.row_key)

union
select'd_work_order_urgency_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_work_order_urgency_c         a12
on (a11.urgency_src_key = a12.row_key)
union
select'd_work_order_impact_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_work_order_impact_c         a12
on (a11.impact_src_key = a12.row_key)
union
select'd_configuration_item_ci_primary_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_configuration_item_ci_primary_c         a12
on (a11.primary_configuration_item_key = a12.row_key)
union

select'd_configuration_item_work_order_ci_site_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_configuration_item_work_order_ci_site_c         a12
on (a11.work_order_ci_site_key = a12.row_key)
union
select'd_configuration_item_ci_tile_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
join ldb.d_configuration_item_ci_tile_c         a12
on (a11.ci_tail_key = a12.row_key)
union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_work_order_c              a11 
  join        ldb.d_calendar_date      a14
                  on         (a11.opened_on_key = a14.row_key)
				    join        ldb.d_calendar_month  a116
                  on         (a14.month_start_date_key = a116.row_key)



