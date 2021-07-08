select 'ldb."f_configuration_item" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
union
select 'ldb."d_configuration_item" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
union
select 'ldb."D_CONFIGURATION_ITEM_MDM" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."D_CONFIGURATION_ITEM_MDM" a13
on (a12.MDM_KEY = a13.ROW_KEY)
union
select 'ldb."d_ci_agebucket" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_agebucket" a14
on (a12.CI_AGE_BUCKET_KEY = a14.ROW_KEY)
union
select 'ldb."d_ci_approval_group" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_approval_group" a15
on (a12.APPROVAL_GROUP_KEY = a15.ROW_KEY)
union
select 'ldb."d_ci_assigned_to" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_assigned_to" a16
on (a12.ASSIGNED_TO_KEY = a16.ROW_KEY)
union
select 'ldb."d_ci_criticality" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_criticality" a17
on (a12.CRITICALITY_KEY = a17.ROW_KEY)
union
select 'ldb."d_ci_cost_center" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_cost_center" a18
on (a12.COST_CENTER_KEY = a18.ROW_KEY)
union
select 'ldb."d_ci_department" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_department" a19
on (a12.DEPARTMENT_KEY = a19.ROW_KEY)
union
select 'ldb."D_LOV_CONFIGURATION_ITEM_DISCOVERY_STATUS_C" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY) join "ldb"."D_CONFIGURATION_ITEM_MDM" a13
on (a12.MDM_KEY = a13.ROW_KEY)
join "ldb"."D_LOV_CONFIGURATION_ITEM_DISCOVERY_STATUS_C" a110
on (a13.DISCOVERY_SOURCE_SRC_C_KEY = a110.ROW_KEY)
union
select 'ldb."D_LOV_CONFIGURATION_ITEM_ENVIRONMENT_C" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY) join "ldb"."D_CONFIGURATION_ITEM_MDM" a13
on (a12.MDM_KEY = a13.ROW_KEY)
join "ldb"."D_LOV_CONFIGURATION_ITEM_ENVIRONMENT_C" a111
on (a13.ENVIRONMENT_SRC_C_KEY = a111.ROW_KEY)
union
select 'ldb."D_CONFIGURATION_ITEM_INSTALL_STATUS_C" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY) join "ldb"."D_CONFIGURATION_ITEM_MDM" a13
on (a12.MDM_KEY = a13.ROW_KEY)
join "ldb"."D_CONFIGURATION_ITEM_INSTALL_STATUS_C" a112
on (a13.INSTALL_STATUS_SRC_C_KEY = a112.ROW_KEY)
union
select 'ldb."d_ci_location" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_location" a113
on (a12.LOCATION_KEY = a113.ROW_KEY)
union
select 'ldb."d_ci_managed_by" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_managed_by" a114
on (a12.MANAGED_BY_KEY = a114.ROW_KEY)
union
select 'ldb."d_ci_manufacturer" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_manufacturer" a115
on (a12.MANUFACTURER_KEY = a115.ROW_KEY)
union
select 'ldb."d_ci_model" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_model" a116
on (a12.MODEL_KEY = a116.ROW_KEY)
union
select 'ldb."d_ci_owned_by" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_owned_by" a117
on (a12.OWNED_BY_KEY = a117.ROW_KEY)
union
select 'ldb."d_ci_operational_status" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_operational_status" a118
on (a12.OPERATIONAL_STATUS_SRC_KEY = a118.ROW_KEY)
union
select 'ldb."d_ci_support_group" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_support_group" a119
on (a12.SUPPORT_GROUP_KEY = a119.ROW_KEY)
union
select 'ldb."d_ci_supported_by" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_supported_by" a120
on (a12.SUPPORTED_BY_KEY = a120.ROW_KEY)
union
select 'ldb."d_ci_vendor" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_configuration_item" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_vendor" a121
on (a12.VENDOR_KEY = a121.ROW_KEY)