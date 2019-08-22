select 'ldb.f_work_item_iteration a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_iteration a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_iteration a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
union
select 'ldb.d_work_item_iteration_m2m a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_iteration a11 
join ldb.d_work_item_iteration_m2m a13 
on (a11.work_item_iteration_m2m_key = a13.row_key) 
union
select 'ldb.d_work_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_iteration a11 
join ldb.d_work_item a14 
on (a11.work_item_key = a14.row_key) 
union
select 'ldb.d_work_item_status a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_iteration a11 
join ldb.d_work_item a14 
on (a11.work_item_key = a14.row_key) 
join ldb.d_work_item_status a15 
on (a14.work_item_status_src_key = a15.row_key) 
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_iteration a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
join ldb.d_calendar_month a16 
on (a12.month_start_date_key = a16.row_key) 
union
select 'ldb.d_work_item_priority a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_iteration a11 
join ldb.d_work_item a14 
on (a11.work_item_key = a14.row_key) 
join ldb.d_work_item_priority a17 
on (a14.work_item_priority_src_key = a17.row_key) 
union
select 'ldb.d_work_item_resolved_by a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_iteration a11 
join ldb.d_work_item a14 
on (a11.work_item_key = a14.row_key) 
join ldb.d_work_item_resolved_by a18 
on (a14.work_item_resolved_by_key = a18.row_key) 
