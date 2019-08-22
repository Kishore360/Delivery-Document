select 'ldb.f_work_item_status a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_status a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_status a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
union
select 'ldb.d_work_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_status a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
union
select 'ldb.d_work_item_epic a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_status a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_work_item_epic a14 
on (a13.work_item_epic_key = a14.row_key) 
union
select 'ldb.d_work_item_status a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_status a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_work_item_status a15 
on (a13.work_item_status_src_key = a15.row_key) 
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_status a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
join ldb.d_calendar_month a16 
on (a12.month_start_date_key = a16.row_key) 
union
select 'ldb.d_project a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_status a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) 
union
select 'ldb.d_work_item_status_from a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_status a11 
join ldb.d_work_item_status_from a18 
on (a11.work_item_from_state_src_key = a18.row_key) 
union
select 'ldb.d_work_item_status_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_status a11 
join ldb.d_work_item_status_to a19 
on (a11.work_item_to_state_src_key = a19.row_key) 
union
select 'ldb.d_work_item_assigned_to a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_status a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_work_item_assigned_to a110 
on (a13.work_item_assigned_to_key = a110.row_key) 
union
select 'ldb.d_work_item_earliest_fixed_version a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_status a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_work_item_earliest_fixed_version a111 
on (a13.earliest_fixed_version_key = a111.row_key) 
union
select 'ldb.d_iteration a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_status a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_iteration a112 
on (a13.iteration_key = a112.row_key) 
union
select 'ldb.d_work_item_priority a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_status a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_work_item_priority a113 
on (a13.work_item_priority_src_key = a113.row_key) 
union
select 'ldb.d_work_item_status_category a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_status a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_work_item_status_category a114 
on (a13.work_item_status_category_src_key = a114.row_key) 
