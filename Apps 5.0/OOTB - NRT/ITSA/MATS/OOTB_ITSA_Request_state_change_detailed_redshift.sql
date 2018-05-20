select 'ldb.f_request_activity a11 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_calendar_date a12 
on (a11.changed_on_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_request a16 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_request a16 
on (a11.request_key = a16.row_key) 
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_calendar_date a12 
on (a11.changed_on_key = a12.row_key) 
join ldb.d_calendar_month a17 
on (a12.month_start_date_key = a17.row_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
union
select 'ldb.d_internal_organization_department a19 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_organization_department a19 
on (a13.department_key = a19.row_key) 
union
select 'ldb.d_sc_request_from_stage a110 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_sc_request_from_stage a110 
on (a11.from_stage_key = a110.row_key) 
union
select 'ldb.d_sc_request_from_request_state a111 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_sc_request_from_request_state a111 
on (a11.from_state_key = a111.row_key) 
union
select 'ldb.d_sc_request_priority a112 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_sc_request_priority a112 
on (a11.priority_src_key = a112.row_key) 
union
select 'ldb.d_sc_request_stage a113 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_sc_request_stage a113 
on (a11.current_stage_src_key = a113.row_key) 
union
select 'ldb.d_sc_request_request_state a114 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_sc_request_request_state a114 
on (a11.current_state_src_key = a114.row_key) 
union
select 'ldb.d_sc_request_to_stage a115 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_sc_request_to_stage a115 
on (a11.to_stage_key = a115.row_key) 
union
select 'ldb.d_sc_request_to_request_state a116 ' as Table_name, count(1) Row_Count
from ldb.f_request_activity a11 
join ldb.d_sc_request_to_request_state a116 
on (a11.to_state_key = a116.row_key) 
