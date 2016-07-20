
select 'ldb.f_facility_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
union
select 'ldb.d_task_impact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_task_impact a12 
on (a11.impact_src_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_internal_organization_department a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_internal_organization_department a17 
on (a11.opened_by_department_key = a17.row_key) 
union
select 'ldb.d_internal_contact_mdm a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a18 
on (a13.row_current_key = a18.row_current_key) 
union
select 'ldb.d_facility_request a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_facility_request a19 
on (a11.facility_request_key = a19.row_key) 
union
select 'ldb.d_facility_request_category a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_facility_request_category a110 
on (a11.category_src_key = a110.row_key) 
union
select 'ldb.d_location a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_location a111 
on (a11.location_key = a111.row_key) 
union
select 'ldb.d_task_approval a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_task_approval a112 
on (a11.approval_state_src_key = a112.row_key) 
union
select 'ldb.d_task_priority a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_task_priority a113 
on (a11.priority_src_key = a113.row_key) 
union
select 'ldb.d_task_contacttype a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_task_contacttype a114 
on (a11.reported_type_src_key = a114.row_key) 
union
select 'ldb.d_task_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_task_state a115 
on (a11.state_src_key = a115.row_key) 
union
select 'ldb.d_task_urgency a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_task_urgency a116 
on (a11.urgency_src_key = a116.row_key) 
union
select 'ldb.d_calendar_month a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_facility_request a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a117 
on (a14.month_start_date_key = a117.row_key) 
