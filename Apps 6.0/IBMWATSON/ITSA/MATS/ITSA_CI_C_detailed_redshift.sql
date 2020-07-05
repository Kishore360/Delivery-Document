select 'ldb.f_ci_tribe_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ci_tribe_c a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ci_tribe_c a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_segment_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ci_tribe_c a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
union
select 'ldb.d_configuration_item_mdm a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ci_tribe_c a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a14
on (a12.mdm_key = a14.row_key)
union
select 'ldb.d_lov_segment_type_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ci_tribe_c a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
join ldb.d_lov_segment_type_c a15
on (a13.segment_type_c_key = a15.row_key)
union
select 'ldb.d_lov_configuration_item_operational_status_src_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ci_tribe_c a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_lov_configuration_item_operational_status_src_c a16
on (a12.operational_status_src_c_key = a16.row_key)
union
select 'ldb.d_ci_tribe_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ci_tribe_c a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key) join ldb.d_configuration_item_mdm a14
on (a12.mdm_key = a14.row_key)
join ldb.d_ci_tribe_c a17
on (a14.tribe_configuration_item_c_key = a17.row_key)