select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
union
select 'ldb.d_incident_contacttype a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident_contacttype a12 
on (a11.reported_type_src_key=a12.row_key) 
union
select 'ldb.d_calendar_date_fiscal a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.fiscal_date_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group_parent_internal_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_parent_internal_c a14 
on (a11.from_assignment_group_c_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a15 
on (a11.date_key = a15.row_key) 
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a15 
on (a11.date_key = a15.row_key) 
join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) 
union
select 'ldb.d_calendar_quarter a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a15 
on (a11.date_key = a15.row_key) join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) 
join ldb.d_calendar_quarter a17 
on (a16.quarter_start_date_key = a17.row_key) 
union
select 'ldb.d_incident a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.fiscal_date_key = a13.row_key) 
join ldb.d_calendar_fiscal_quarter a19 
on (a13.quarter_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_fiscal_year a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.fiscal_date_key = a13.row_key) 
join ldb.d_calendar_fiscal_year a110 
on (a13.year_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_week a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a15 
on (a11.date_key = a15.row_key) 
join ldb.d_calendar_week a111 
on (a15.week_start_date_key = a111.row_key) 
union
select 'ldb.d_calendar_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a15 
on (a11.date_key = a15.row_key) join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) join ldb.d_calendar_quarter a17 
on (a16.quarter_start_date_key = a17.row_key) 
join ldb.d_calendar_year a112 
on (a17.year_start_date_key = a112.row_key) 
union
select 'ldb.d_lov_incident_state_incident_activity_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_lov_incident_state_incident_activity_c a113 
on (a11.state_c_key = a113.row_key) 
union
select 'ldb.d_internal_organization_group a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group a114 
on (a11.current_assignment_group_key = a114.row_key) 
union
select 'ldb.d_internal_organization_incident_activity_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_incident_activity_c a115 
on (a11.assignment_group_c_key = a115.row_key) 
union
select 'ldb.d_category_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_category_c a116 
on (a11.category_5_c_key = a116.row_key) 
union
select 'ldb.d_internal_contact_to a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_to a117 
on (a11.to_assigned_to_key = a117.row_key) 
union
select 'ldb.d_internal_organization_group_to a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_to a118 
on (a11.to_assignment_group_key = a118.row_key) 
union
select 'ldb.d_internal_contact_from a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_from a119 
on (a11.from_assigned_to_key = a119.row_key) 
union
select 'ldb.d_internal_organization_group_from a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_from a120 
on (a11.from_assignment_group_key = a120.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_parent_internal_c a14 
on (a11.from_assignment_group_c_key = a14.row_key) 
join ldb.d_internal_organization_group_parent_c a121 
on (a14.parent_row_c_key = a121.row_key) 
union
select 'ldb.d_incident_priority a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_incident_priority a122 
on (a18.priority_src_key = a122.row_key) 
union
select 'ldb.d_incident_state a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_incident_state a123 
on (a18.state_src_key = a123.row_key) 
