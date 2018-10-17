select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.f_incident_activity a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_activity a12 
on (a11.assignment_group_key = a12.assignment_group_key and a11.assignment_group_key = a12.current_assginment_group_key and a11.assignment_group_key = a12.from_assignment_group_key and a11.category_5_c_key = a12.category_5_c_key and a11.incident_key = a12.incident_key and a11.opened_on_key = a12.assigned_on_key and a11.opened_on_key = a12.opened_on_key and a11.reported_type_src_key = a12.reported_type_src_key) 
union
select 'ldb.d_lov_incident_state_incident_activity_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_activity a12 
on (a11.assignment_group_key = a12.assignment_group_key and a11.assignment_group_key = a12.current_assginment_group_key and a11.assignment_group_key = a12.from_assignment_group_key and a11.category_5_c_key = a12.category_5_c_key and a11.incident_key = a12.incident_key and a11.opened_on_key = a12.assigned_on_key and a11.opened_on_key = a12.opened_on_key and a11.reported_type_src_key = a12.reported_type_src_key) 
join ldb.d_lov_incident_state_incident_activity_c a13 
on (a12.state_key = a13.row_key) 
union
select 'ldb.d_calendar_date_fiscal a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group_parent_internal_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group_parent_internal_c a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
union
select 'ldb.d_incident a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_month a19 
on (a17.month_start_date_key = a19.row_key) 
union
select 'ldb.d_internal_organization_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a110 
on (a11.assignment_group_key = a110.row_key) 
union
select 'ldb.d_internal_organization_incident_activity_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_incident_activity_c a111 
on (a11.assignment_group_key = a111.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_fiscal_quarter a112 
on (a15.quarter_start_date_key = a112.row_key) 
union
select 'ldb.d_category_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_category_c a113 
on (a11.category_5_c_key = a113.row_key) 
union
select 'ldb.d_incident_contacttype a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contacttype a114 
on (a11.reported_type_src_key = a114.row_key) 
union
select 'ldb.d_internal_contact_to a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_activity a12 
on (a11.assignment_group_key = a12.assignment_group_key 
and a11.assignment_group_key = a12.current_assginment_group_key 
and a11.assignment_group_key = a12.from_assignment_group_key 
and a11.category_5_c_key = a12.category_5_c_key 
and a11.incident_key = a12.incident_key  
and a11.opened_on_key = a12.assigned_on_key
and a11.opened_on_key = a12.opened_on_key 
and a11.reported_type_src_key = a12.reported_type_src_key) 
join ldb.d_internal_contact_to a115 
on (a12.to_assigned_to_key = a115.row_key) 
union
select 'ldb.d_internal_organization_group_to a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_activity a12 
on (a11.assignment_group_key = a12.assignment_group_key and a11.assignment_group_key = a12.current_assginment_group_key and a11.assignment_group_key = a12.from_assignment_group_key and a11.category_5_c_key = a12.category_5_c_key and a11.incident_key = a12.incident_key and a11.opened_on_key = a12.assigned_on_key and a11.opened_on_key = a12.opened_on_key and a11.reported_type_src_key = a12.reported_type_src_key) 
join ldb.d_internal_organization_group_to a116 
on (a12.to_assignment_group_key = a116.row_key) 
union
select 'ldb.d_internal_contact_from a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_activity a12 
on (a11.assignment_group_key = a12.assignment_group_key and a11.assignment_group_key = a12.current_assginment_group_key and a11.assignment_group_key = a12.from_assignment_group_key and a11.category_5_c_key = a12.category_5_c_key and a11.incident_key = a12.incident_key and a11.opened_on_key = a12.assigned_on_key and a11.opened_on_key = a12.opened_on_key and a11.reported_type_src_key = a12.reported_type_src_key) 
join ldb.d_internal_contact_from a117 
on (a12.from_assigned_to_key = a117.row_key) 
union
select 'ldb.d_internal_organization_group_from a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_activity a12 
on (a11.assignment_group_key = a12.assignment_group_key and a11.assignment_group_key = a12.current_assginment_group_key and a11.assignment_group_key = a12.from_assignment_group_key and a11.category_5_c_key = a12.category_5_c_key and a11.incident_key = a12.incident_key and a11.opened_on_key = a12.assigned_on_key and a11.opened_on_key = a12.opened_on_key and a11.reported_type_src_key = a12.reported_type_src_key) 
join ldb.d_internal_organization_group_from a118 
on (a12.from_assignment_group_key = a118.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group_parent_internal_c a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.d_internal_organization_group_parent_c a119 
on (a16.parent_row_key_c = a119.row_key) 
union
select 'ldb.d_calendar_fiscal_year a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_fiscal_year a120 
on (a15.year_start_date_key = a120.row_key) 
union
select 'ldb.d_incident_priority a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_incident_priority a121 
on (a18.priority_src_key = a121.row_key) 
union
select 'ldb.d_incident_state a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_incident_state a122 
on (a18.state_src_key = a122.row_key) 
union
select 'ldb.d_calendar_quarter a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_quarter a123 
on (a17.quarter_start_date_key = a123.row_key) 
union
select 'ldb.d_calendar_year a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_year a124 
on (a17.year_start_date_key = a124.row_key) 
