select 'ldb.f_task_tag_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11
union
select 'ldb.d_segment_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
union
select 'ldb.d_task a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11
join ldb.d_task a13
on (a11.task_key = a13.row_key)
union
select 'ldb.d_task_tag_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11
join ldb.d_task_tag_c a14
on (a11.task_tag_c_key = a14.row_key)
union
select 'ldb.d_task_tag_task_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11
join ldb.d_task_tag_c a14
on (a11.task_tag_c_key = a14.row_key)
join ldb.d_task_tag_task_c a15
on (a14.task_tag_task_c_key = a15.row_key)
union
select 'ldb.d_lov_segment_type_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
join ldb.d_lov_segment_type_c a16
on (a12.segment_type_c_key = a16.row_key)
union
select 'ldb.d_lov_tag_type_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11
join ldb.d_task_tag_c a14
on (a11.task_tag_c_key = a14.row_key)
join ldb.d_lov_tag_type_c a17
on (a14.tag_type_src_c_key = a17.row_key)
union
select 'ldb.d_lov_tag_viewable_by_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11
join ldb.d_task_tag_c a14
on (a11.task_tag_c_key = a14.row_key)
join ldb.d_lov_tag_viewable_by_c a18
on (a14.viewable_by_src_c_key = a18.row_key)
union
select 'ldb.d_lov_task_type_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11
join ldb.d_task_tag_c a14
on (a11.task_tag_c_key = a14.row_key)
join ldb.d_lov_task_type_c a19
on (a14.task_type_src_key = a19.row_key)
union
select 'ldb.d_task_tag_tribe_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_tag_c a11
join ldb.d_task_tag_c a14
on (a11.task_tag_c_key = a14.row_key) join ldb.d_task_tag_task_c a15
on (a14.task_tag_task_c_key = a15.row_key)
join ldb.d_task_tag_tribe_c a110
on (a15.task_tribe_c_key = a110.row_key)