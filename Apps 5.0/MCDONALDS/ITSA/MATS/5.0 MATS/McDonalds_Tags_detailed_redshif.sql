select 'ldb.f_task_tag_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11 
union
select 'ldb.d_task_tag_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11 
join ldb.d_task_tag_c a12 
on (a11.task_tag_c_key = a12.row_key) 
union
select 'ldb.d_change_request a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
union
select 'ldb.d_problem a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11 
join ldb.d_problem a15 
on (a11.problem_key = a15.row_key) 
union
select 'ldb.d_problem_task a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11 
join ldb.d_problem_task a16 
on (a11.problem_task_key = a16.row_key) 
union
select 'ldb.d_request a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11 
join ldb.d_request a17 
on (a11.request_key = a17.row_key) 
union
select 'ldb.d_request_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11 
join ldb.d_request_item a18 
on (a11.request_item_key = a18.row_key) 
union
select 'ldb.d_request_task a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11 
join ldb.d_request_task a19 
on (a11.request_task_key = a19.row_key) 
union
select 'ldb.d_lov_task_tag_type_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11 
join ldb.d_lov_task_tag_type_c a110 
on (a11.type_src_key = a110.row_key) 