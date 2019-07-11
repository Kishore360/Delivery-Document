select 'ldb.f_task_tag_c a11' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11 
union
select 'ldb.d_task  a12' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11
join ldb.d_task  a12
on (a11.task_key = a12.row_key)
union
select 'ldb.d_task_tag_c a13' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11
join ldb.d_task_tag_c a13
on (a11.task_tag_c_key = a13.row_key)
union
select 'ldb.d_lov_tag_type_c a14' as Table_name,count(a11.row_key) Row_count
from ldb.f_task_tag_c a11
join ldb.d_task_tag_c a13
on (a11.task_tag_c_key = a13.row_key)
join ldb.d_lov_tag_type_c a14
on (a13.tag_type_src_c_key = a14.row_key)
union
select 'ldb.d_lov_tag_viewable_by_c  a15' as Table_name, count(a11.row_key)Row_Count
from ldb.f_task_tag_c a11
join ldb.d_task_tag_c a13
on (a11.task_tag_c_key = a13.row_key)
join ldb.d_lov_tag_viewable_by_c  a15
on (a13.viewable_by_src_c_key = a15.row_key)
union
select 'ldb.d_lov_task_type_c  a16' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11
join ldb.d_task_tag_c a13
on (a11.task_tag_c_key = a13.row_key)
join ldb.d_lov_task_type_c  a16
on (a13.task_type_src_key = a16.row_key)
