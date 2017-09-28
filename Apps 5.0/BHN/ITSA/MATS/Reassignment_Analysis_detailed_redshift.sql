select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
UNION
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
 join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
UNION
select 'ldb.d_incident a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
 join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
UNION
select 'ldb.d_incident_class_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
 join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_incident_class_c a13 
on (a11.class_c_key = a13.row_key) 
UNION
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
 join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
UNION
select 'ldb.d_calendar_week a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
 join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_week a15 
on (a14.week_start_date_key = a15.row_key) 
UNION
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
 join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_week a15 
on (a14.week_start_date_key = a15.row_key) 
join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) 
UNION
select 'ldb.d_calendar_quarter a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
 join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) join ldb.d_calendar_week a15 
on (a14.week_start_date_key = a15.row_key) join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) 
join ldb.d_calendar_quarter a17 
on (a16.quarter_start_date_key = a17.row_key) 
UNION
select 'ldb.d_calendar_year a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
 join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) join ldb.d_calendar_week a15 
on (a14.week_start_date_key = a15.row_key) join ldb.d_calendar_month a16 
on (a15.month_start_date_key = a16.row_key) join ldb.d_calendar_quarter a17 
on (a16.quarter_start_date_key = a17.row_key) 
join ldb.d_calendar_year a18 
on (a17.year_start_date_key = a18.row_key) 
UNION
select 'ldb.d_internal_organization_group_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
  join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_internal_organization_group_to a19 
on (a12.to_assignment_group_key = a19.row_key) 
UNION
select 'ldb.d_internal_organization_group_from a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
  join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_internal_organization_group_from a110 
on (a12.from_assignment_group_key = a110.row_key) 
UNION
select 'ldb.d_internal_contact_to a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
  join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_internal_contact_to a114 
on (a12.to_assigned_to_key = a114.row_key) 
UNION
select 'ldb.d_internal_contact_from a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
  join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_internal_contact_from a115 
on (a12.from_assigned_to_key = a115.row_key) 
UNION
select 'ldb.d_incident_priority a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
 join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_incident_priority a119 
on (a11.priority_src_key = a119.row_key) 
UNION
select 'ldb.d_incident_contacttype a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
 join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_incident_contacttype a120 
on (a11.reported_type_src_key = a120.row_key) 
UNION
select 'ldb.d_incident_state a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
 join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
join ldb.d_incident_state a122 
on (a13.state_src_key = a122.row_key) 
UNION
select 'ldb.d_incident_call_category_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
 join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_incident_call_category_c a13 
on (a11.call_categroy_c_key= a13.row_key) 
UNION
select 'ldb.d_incident_lob_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
 join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.class_c_key = a12.class_c_key and 
                a11.incident_key = a12.incident_key and 
                -- a11.opened_on_key = a12.assigned_on_key and 
                a11.priority_src_key = a12.priority_src_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
join ldb.d_incident_lob_c a13 
on (a11.line_of_business_c_key= a13.row_key) 
