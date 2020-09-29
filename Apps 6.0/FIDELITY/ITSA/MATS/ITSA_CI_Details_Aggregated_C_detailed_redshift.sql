select 'ldb."f_configuration_item" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
union
select 'ldb."d_configuration_item" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a13
on (a12.mdm_key = a13.ROW_KEY)
union
select 'ldb."d_ci_criticality" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_criticality" a14
on (a12.criticality_key = a14.ROW_KEY)
union
select 'ldb."d_ci_department" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_department" a15
on (a12.department_key = a15.ROW_KEY)
union
select 'ldb."d_ci_location" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_location" a16
on (a12.LOCATION_KEY = a16.ROW_KEY)
union
select 'ldb."d_ci_managed_by" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_managed_by" a17
on (a12.managed_by_key = a17.ROW_KEY)
union
select 'ldb."d_ci_manufacturer" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_manufacturer" a18
on (a12.manufacturer_key = a18.ROW_KEY)
union
select 'ldb."d_ci_owned_by" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_owned_by" a19
on (a12.owned_by_key = a19.ROW_KEY)
union
select 'ldb."d_ci_operational_status" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_operational_status" a110
on (a12.operational_status_src_key = a110.ROW_KEY)
union
select 'ldb."d_ci_support_group" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_support_group" a111
on (a12.support_group_key = a111.ROW_KEY)
union
select 'ldb."d_ci_supported_by" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_supported_by" a112
on (a12.supported_by_key = a112.ROW_KEY)
union
select 'ldb."d_ci_vendor" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_vendor" a113
on (a12.vendor_key = a113.ROW_KEY)