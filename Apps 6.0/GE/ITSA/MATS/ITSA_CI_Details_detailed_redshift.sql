select 'ldb.f_configuration_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_configuration_item_mdm a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a13
on (a12.mdm_key = a13.row_key)
union
select 'ldb.d_ci_agebucket a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_agebucket a14
on (a12.ci_age_bucket_key = a14.row_key)
union
select 'ldb.d_ci_approval_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_approval_group a15
on (a12.approval_group_key = a15.row_key)
union
select 'ldb.d_ci_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_assigned_to a16
on (a12.assigned_to_key = a16.row_key)
union
select 'ldb.d_ci_criticality a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_criticality a17
on (a12.criticality_key = a17.row_key)
union
select 'ldb.d_ci_cost_center a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_cost_center a18
on (a12.cost_center_key = a18.row_key)
union
select 'ldb.d_ci_department a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_department a19
on (a12.department_key = a19.row_key)
union
select 'ldb.d_ci_location a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_location a110
on (a12.location_key = a110.row_key)
union
select 'ldb.d_ci_managed_by a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_managed_by a111
on (a12.managed_by_key = a111.row_key)
union
select 'ldb.d_ci_manufacturer a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_manufacturer a112
on (a12.manufacturer_key = a112.row_key)
union
select 'ldb.d_ci_model a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_model a113
on (a12.model_key = a113.row_key)
union
select 'ldb.d_ci_owned_by a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_owned_by a114
on (a12.owned_by_key = a114.row_key)
union
select 'ldb.d_ci_operational_status a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_operational_status a115
on (a12.operational_status_src_key = a115.row_key)
union
select 'ldb.d_ci_support_group a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_support_group a116
on (a12.support_group_key = a116.row_key)
union
select 'ldb.d_ci_supported_by a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_supported_by a117
on (a12.supported_by_key = a117.row_key)
union
select 'ldb.d_ci_vendor a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_vendor a118
on (a12.vendor_key = a118.row_key)