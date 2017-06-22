select 'ldb.f_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_internal_contact a12 
on (a11.assigned_to_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_calendar_week a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_week a14 
on (a13.week_start_date_key = a14.row_key) 
union
select 'ldb.d_task a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_task a15 
on (a11.task_key = a15.row_key) 
union
select 'ldb.d_application a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_application a16 
on (a11.application_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_business_service a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
union
select 'ldb.d_task_state_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_task_state_c a110 
on (a11.state_src_key = a110.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_internal_contact_task_closed_by a111 
on (a11.closed_by_key = a111.row_key) 
union
select 'ldb.d_task_contacttype a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_task_contacttype a112 
on (a11.contact_type_src_key = a112.row_key) 
union
select 'ldb.d_internal_contact_task_opened_by_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_internal_contact_task_opened_by_c a113 
on (a11.opened_by_key = a113.row_key) 
union
select 'ldb.d_task_priority a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_task_priority a114 
on (a11.priority_src_key = a114.row_key) 
union
select 'ldb.d_calendar_month a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_month a115 
on (a13.month_start_date_key = a115.row_key) 
union
select 'ldb.d_calendar_quarter a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_quarter a116 
on (a13.quarter_start_date_key = a116.row_key)