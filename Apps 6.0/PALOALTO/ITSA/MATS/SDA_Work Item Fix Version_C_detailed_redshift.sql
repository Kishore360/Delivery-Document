select 'ldb.f_work_item_fix_version a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_fix_version a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_fix_version a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
union
select 'ldb.d_work_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_fix_version a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
union
select 'ldb.d_work_item_status a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_fix_version a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_work_item_status a14 
on (a13.work_item_status_src_key = a14.row_key) 
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_fix_version a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
join ldb.d_calendar_month a15 
on (a12.month_start_date_key = a15.row_key) 
union
select 'ldb.d_work_item_fix_version a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_fix_version a11 
join ldb.d_work_item_fix_version a16 
on (a11.project_fixed_version_key = a16.row_key) 
union
select 'ldb.d_iteration a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_fix_version a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_iteration a17 
on (a13.iteration_key = a17.row_key) 
union
select 'ldb.d_work_item_priority a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_fix_version a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_work_item_priority a18 
on (a13.work_item_priority_src_key = a18.row_key) 
union
select 'ldb.d_work_item_reason a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_fix_version a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_work_item_reason a19 
on (a13.work_item_reason_src_key = a19.row_key) 
union
select 'ldb.d_work_item_resolved_by a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_fix_version a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_work_item_resolved_by a110 
on (a13.work_item_resolved_by_key = a110.row_key) 
