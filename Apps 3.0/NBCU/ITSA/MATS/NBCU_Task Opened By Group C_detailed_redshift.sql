

select 'ldb.f_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.f_opened_by_group_member_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.f_opened_by_group_member_c a13 
on (a11.opened_by_key = a13.opened_by_key) 
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_month a14 
on (a12.month_start_date_key = a14.row_key) 
union
select 'ldb.d_internal_contact_task_opened_by_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_internal_contact_task_opened_by_c a15 
on (a11.opened_by_key = a15.row_key) 
union
select 'ldb.d_internal_org_opened_by_group_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c a11 
join ldb.f_opened_by_group_member_c a13 
on (a11.opened_by_key = a13.opened_by_key) 
join ldb.d_internal_org_opened_by_group_c a16 
on (a13.group_key = a16.row_key) 
