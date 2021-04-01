select 'ldb."F_INCIDENT" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."D_CONFIGURATION_ITEM" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_CONFIGURATION_ITEM" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."D_INCIDENT" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.INCIDENT_KEY = a14.ROW_KEY)
union
select 'ldb."d_application_mdm" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a15
on (a12.MDM_KEY = a15.ROW_KEY)
union
select 'ldb."d_fmr_product_c" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.MDM_KEY = a15.ROW_KEY)
join "ldb"."d_fmr_product_c" a16
on (a15.FMR_PRODUCT_C_KEY = a16.ROW_KEY)
union
select 'ldb."d_fmr_product_line_c" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.MDM_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a15.FMR_PRODUCT_C_KEY = a16.ROW_KEY)
join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY)
union
select 'ldb."d_fmr_cost_center_c" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.MDM_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a15.FMR_PRODUCT_C_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY)
join "ldb"."d_fmr_cost_center_c" a18
on (a17.COST_CENTER_C_KEY = a18.ROW_KEY)
union
select 'ldb."d_fmr_business_unit_c" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.MDM_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a15.FMR_PRODUCT_C_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.COST_CENTER_C_KEY = a18.ROW_KEY)
join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY)
union
select 'ldb."d_fmr_business_group_c" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.MDM_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a15.FMR_PRODUCT_C_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.COST_CENTER_C_KEY = a18.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY)
join "ldb"."d_fmr_business_group_c" a110
on (a19.fmr_business_group_c_key = a110.ROW_KEY)
union
select 'ldb."d_fmr_operating_committee_c" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.MDM_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a15.FMR_PRODUCT_C_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.COST_CENTER_C_KEY = a18.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY) join "ldb"."d_fmr_business_group_c" a110
on (a19.fmr_business_group_c_key = a110.ROW_KEY)
join "ldb"."d_fmr_operating_committee_c" a111
on (a110.fmr_operating_committee_c_key = a111.ROW_KEY)
union
select 'ldb."d_fmr_cio_group_c" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.MDM_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a15.FMR_PRODUCT_C_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.COST_CENTER_C_KEY = a18.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY) join "ldb"."d_fmr_business_group_c" a110
on (a19.fmr_business_group_c_key = a110.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a111
on (a110.fmr_operating_committee_c_key = a111.ROW_KEY)
join "ldb"."d_fmr_cio_group_c" a112
on (a111.fmr_cio_group_c_key = a112.ROW_KEY)
union
select 'ldb."D_CONFIGURATION_ITEM_MDM" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_CONFIGURATION_ITEM" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."D_CONFIGURATION_ITEM_MDM" a113
on (a13.MDM_KEY = a113.ROW_KEY)
union
select 'ldb."d_incident_date" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_incident_date" a114
on (a11.INCIDENT_DATE_KEY = a114.ROW_KEY)
union
select 'ldb."d_internal_contact_cio_user_c" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.MDM_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a15.FMR_PRODUCT_C_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.COST_CENTER_C_KEY = a18.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY) join "ldb"."d_fmr_business_group_c" a110
on (a19.fmr_business_group_c_key = a110.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a111
on (a110.fmr_operating_committee_c_key = a111.ROW_KEY) join "ldb"."d_fmr_cio_group_c" a112
on (a111.fmr_cio_group_c_key = a112.ROW_KEY)
join "ldb"."d_internal_contact_cio_user_c" a115
on (a112.CIO_USER_C_KEY = a115.ROW_KEY)