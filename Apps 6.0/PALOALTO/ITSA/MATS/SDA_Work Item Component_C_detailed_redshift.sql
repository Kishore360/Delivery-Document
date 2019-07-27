select 'ldb.f_work_item_component a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_component a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_component a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
union
select 'ldb.d_work_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_component a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
union
select 'ldb.d_work_item_status a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_component a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_work_item_status a14 
on (a13.work_item_status_src_key = a14.row_key) 
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_component a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
join ldb.d_calendar_month a15 
on (a12.month_start_date_key = a15.row_key) 
union
select 'ldb.d_component a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_component a11 
join ldb.d_component a16 
on (a11.component_key = a16.row_key) 
union
select 'ldb.d_work_item_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_component a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_work_item_assigned_to a17 
on (a13.work_item_assigned_to_key = a17.row_key) 
union
select 'ldb.d_work_item_priority a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_component a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_work_item_priority a18 
on (a13.work_item_priority_src_key = a18.row_key) 
union
select 'ldb.d_work_item_type a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item_component a11 
join ldb.d_work_item a13 
on (a11.work_item_key = a13.row_key) 
join ldb.d_work_item_type a19 
on (a13.work_item_type_src_key = a19.row_key) 
