select 'ldb.f_case_state_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11
union
select 'ldb.d_segment_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
union
select 'ldb.d_case a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11
join ldb.d_case a13
on (a11.case_key = a13.row_key)
union
select 'ldb.d_lov_case_state_from_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11
join ldb.d_lov_case_state_from_c a14
on (a11.from_state_src_c_key = a14.row_key)
union
select 'ldb.d_lov_case_state_to_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11
join ldb.d_lov_case_state_to_c a15
on (a11.to_state_src_c_key = a15.row_key)
union
select 'ldb.d_lov_segment_type_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
join ldb.d_lov_segment_type_c a16
on (a12.segment_type_c_key = a16.row_key)
union
select 'ldb.d_case_tribe_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11
join ldb.d_case a13
on (a11.case_key = a13.row_key)
join ldb.d_case_tribe_c a17
on (a13.case_tribe_c_key = a17.row_key)
union
select 'ldb.d_lov_case_status_src_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11
join ldb.d_case a13
on (a11.case_key = a13.row_key)
join ldb.d_lov_case_status_src_c a18
on (a13.status_src_c_key = a18.row_key)