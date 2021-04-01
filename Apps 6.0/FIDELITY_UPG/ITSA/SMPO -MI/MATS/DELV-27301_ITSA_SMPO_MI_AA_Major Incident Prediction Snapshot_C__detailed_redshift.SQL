select 'ldb."f_n_major_incident" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."D_CONFIGURATION_ITEM" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."D_CONFIGURATION_ITEM" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_application_mdm" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a14
on (a12.MDM_KEY = a14.ROW_KEY)
union
select 'ldb."d_fmr_product_c" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a12.MDM_KEY = a14.ROW_KEY)
join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY)
union
select 'ldb."d_fmr_product_line_c" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a12.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY)
join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY)
union
select 'ldb."d_fmr_cost_center_c" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a12.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY)
join "ldb"."d_fmr_cost_center_c" a17
on (a16.COST_CENTER_C_KEY = a17.ROW_KEY)
union
select 'ldb."d_fmr_business_unit_c" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a12.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.COST_CENTER_C_KEY = a17.ROW_KEY)
join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY)
union
select 'ldb."d_fmr_business_group_c" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a12.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.COST_CENTER_C_KEY = a17.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY)
join "ldb"."d_fmr_business_group_c" a19
on (a18.fmr_business_group_c_key = a19.ROW_KEY)
union
select 'ldb."d_fmr_operating_committee_c" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a12.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.COST_CENTER_C_KEY = a17.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY) join "ldb"."d_fmr_business_group_c" a19
on (a18.fmr_business_group_c_key = a19.ROW_KEY)
join "ldb"."d_fmr_operating_committee_c" a110
on (a19.fmr_operating_committee_c_key = a110.ROW_KEY)
union
select 'ldb."d_fmr_cio_group_c" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a12.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.COST_CENTER_C_KEY = a17.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY) join "ldb"."d_fmr_business_group_c" a19
on (a18.fmr_business_group_c_key = a19.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a110
on (a19.fmr_operating_committee_c_key = a110.ROW_KEY)
join "ldb"."d_fmr_cio_group_c" a111
on (a110.fmr_cio_group_c_key = a111.ROW_KEY)
union
select 'ldb."D_CALENDAR_DATE" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."D_CALENDAR_DATE" a112
on (a11.DATE_KEY = a112.ROW_KEY)
union
select 'ldb."D_CONFIGURATION_ITEM_MDM" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."D_CONFIGURATION_ITEM" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."D_CONFIGURATION_ITEM_MDM" a113
on (a13.MDM_KEY = a113.ROW_KEY)
union
select 'ldb."d_major_incident_risk_prediction" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."d_major_incident_risk_prediction" a114
on (a11.major_incident_risk_prediction_key = a114.ROW_KEY)
union
select 'ldb."d_ci_criticality" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."D_CONFIGURATION_ITEM" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_ci_criticality" a115
on (a13.CRITICALITY_KEY = a115.ROW_KEY)
union
select 'ldb."d_ci_department" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."D_CONFIGURATION_ITEM" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_ci_department" a116
on (a13.DEPARTMENT_KEY = a116.ROW_KEY)
union
select 'ldb."d_ci_location" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."D_CONFIGURATION_ITEM" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_ci_location" a117
on (a13.LOCATION_KEY = a117.ROW_KEY)
union
select 'ldb."d_ci_managed_by" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."D_CONFIGURATION_ITEM" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_ci_managed_by" a118
on (a13.MANAGED_BY_KEY = a118.ROW_KEY)
union
select 'ldb."d_ci_owned_by" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."D_CONFIGURATION_ITEM" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_ci_owned_by" a119
on (a13.OWNED_BY_KEY = a119.ROW_KEY)
union
select 'ldb."d_ci_support_group" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."D_CONFIGURATION_ITEM" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_ci_support_group" a120
on (a13.SUPPORT_GROUP_KEY = a120.ROW_KEY)
union
select 'ldb."d_ci_supported_by" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."D_CONFIGURATION_ITEM" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_ci_supported_by" a121
on (a13.SUPPORTED_BY_KEY = a121.ROW_KEY)
union
select 'ldb."d_internal_contact_cio_user_c" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_n_major_incident" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a12.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.COST_CENTER_C_KEY = a17.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY) join "ldb"."d_fmr_business_group_c" a19
on (a18.fmr_business_group_c_key = a19.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a110
on (a19.fmr_operating_committee_c_key = a110.ROW_KEY) join "ldb"."d_fmr_cio_group_c" a111
on (a110.fmr_cio_group_c_key = a111.ROW_KEY)
join "ldb"."d_internal_contact_cio_user_c" a122
on (a111.CIO_USER_C_KEY = a122.ROW_KEY)




