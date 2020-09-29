select 'ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
union
select 'ldb."d_configuration_item" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
union
select 'ldb."d_application" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY)
union
select 'ldb."d_application_mdm" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY)
join "ldb"."d_application_mdm" a14
on (a13.mdm_key = a14.ROW_KEY)
union
select 'ldb."d_fmr_product_c" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.mdm_key = a14.ROW_KEY)
join "ldb"."d_fmr_product_c" a15
on (a14.fmr_product_c_key = a15.ROW_KEY)
union
select 'ldb."d_fmr_product_line_c" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.mdm_key = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.fmr_product_c_key = a15.ROW_KEY)
join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY)
union
select 'ldb."d_fmr_cost_center_c" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.mdm_key = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.fmr_product_c_key = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY)
join "ldb"."d_fmr_cost_center_c" a17
on (a16.cost_center_c_key = a17.ROW_KEY)
union
select 'ldb."d_fmr_business_unit_c" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.mdm_key = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.fmr_product_c_key = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.cost_center_c_key = a17.ROW_KEY)
join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY)
union
select 'ldb."d_fmr_business_group_c" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.mdm_key = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.fmr_product_c_key = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.cost_center_c_key = a17.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY)
join "ldb"."d_fmr_business_group_c" a19
on (a18.fmr_business_group_c_key = a19.ROW_KEY)
union
select 'ldb."d_fmr_operating_committee_c" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.mdm_key = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.fmr_product_c_key = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.cost_center_c_key = a17.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY) join "ldb"."d_fmr_business_group_c" a19
on (a18.fmr_business_group_c_key = a19.ROW_KEY)
join "ldb"."d_fmr_operating_committee_c" a110
on (a19.fmr_operating_committee_c_key = a110.ROW_KEY)
union
select 'ldb."d_fmr_cio_group_c" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.mdm_key = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.fmr_product_c_key = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.cost_center_c_key = a17.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY) join "ldb"."d_fmr_business_group_c" a19
on (a18.fmr_business_group_c_key = a19.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a110
on (a19.fmr_operating_committee_c_key = a110.ROW_KEY)
join "ldb"."d_fmr_cio_group_c" a111
on (a110.fmr_cio_group_c_key = a111.ROW_KEY)
union
select 'ldb."D_INCIDENT" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."D_INCIDENT" a112
on (a11.INCIDENT_KEY = a112.ROW_KEY)
union
select 'ldb."d_incident_application_c" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."D_INCIDENT" a112
on (a11.INCIDENT_KEY = a112.ROW_KEY)
join "ldb"."d_incident_application_c" a113
on (a112.APPLICATION_C_KEY = a113.ROW_KEY)
union
select 'ldb."d_incident_assignment_group_c" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."D_INCIDENT" a112
on (a11.INCIDENT_KEY = a112.ROW_KEY)
join "ldb"."d_incident_assignment_group_c" a114
on (a112.ASSIGNMENT_GROUP_C_KEY = a114.ROW_KEY)
union
select 'ldb."d_incident_configuration_item_c" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."D_INCIDENT" a112
on (a11.INCIDENT_KEY = a112.ROW_KEY)
join "ldb"."d_incident_configuration_item_c" a115
on (a112.CONFIGURATION_ITEM_C_KEY = a115.ROW_KEY)
union
select 'ldb."d_calendar_date" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_calendar_date" a116
on (a11.DATE_KEY = a116.ROW_KEY)
union
select 'ldb."d_calendar_month" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_calendar_date" a116
on (a11.DATE_KEY = a116.ROW_KEY)
join "ldb"."d_calendar_month" a117
on (a116.month_start_date_key = a117.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a118
on (a12.mdm_key = a118.ROW_KEY)
union
select 'ldb."d_lov_incident_environment_c" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."D_INCIDENT" a112
on (a11.INCIDENT_KEY = a112.ROW_KEY)
join "ldb"."d_lov_incident_environment_c" a119
on (a112.ENVIRONMENT_SRC_C_KEY = a119.ROW_KEY)
union
select 'ldb."d_cio_group_status_c" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.mdm_key = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.fmr_product_c_key = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.cost_center_c_key = a17.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY) join "ldb"."d_fmr_business_group_c" a19
on (a18.fmr_business_group_c_key = a19.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a110
on (a19.fmr_operating_committee_c_key = a110.ROW_KEY) join "ldb"."d_fmr_cio_group_c" a111
on (a110.fmr_cio_group_c_key = a111.ROW_KEY)
join "ldb"."d_cio_group_status_c" a120
on (a111.cio_group_status_c_key = a120.ROW_KEY)