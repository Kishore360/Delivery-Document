select 'ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."d_change_request_caused_by" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_change_request_caused_by" a13
on (a11.CAUSED_BY_CHANGE_KEY = a13.ROW_KEY)
union
select 'ldb."d_configuration_item" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_configuration_item" a14
on (a11.CONFIGURATION_ITEM_KEY = a14.ROW_KEY)
union
select 'ldb."d_application_mdm" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a15
on (a12.mdm_key = a15.ROW_KEY)
union
select 'ldb."d_fmr_product_c" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.mdm_key = a15.ROW_KEY)
join "ldb"."d_fmr_product_c" a16
on (a15.fmr_product_c_key = a16.ROW_KEY)
union
select 'ldb."d_fmr_product_line_c" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.mdm_key = a15.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a15.fmr_product_c_key = a16.ROW_KEY)
join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY)
union
select 'ldb."d_fmr_cost_center_c" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.mdm_key = a15.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a15.fmr_product_c_key = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY)
join "ldb"."d_fmr_cost_center_c" a18
on (a17.cost_center_c_key = a18.ROW_KEY)
union
select 'ldb."d_fmr_business_unit_c" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.mdm_key = a15.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a15.fmr_product_c_key = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.cost_center_c_key = a18.ROW_KEY)
join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY)
union
select 'ldb."d_fmr_business_group_c" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.mdm_key = a15.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a15.fmr_product_c_key = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.cost_center_c_key = a18.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY)
join "ldb"."d_fmr_business_group_c" a110
on (a19.fmr_business_group_c_key = a110.ROW_KEY)
union
select 'ldb."d_fmr_operating_committee_c" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.mdm_key = a15.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a15.fmr_product_c_key = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.cost_center_c_key = a18.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY) join "ldb"."d_fmr_business_group_c" a110
on (a19.fmr_business_group_c_key = a110.ROW_KEY)
join "ldb"."d_fmr_operating_committee_c" a111
on (a110.fmr_operating_committee_c_key = a111.ROW_KEY)
union
select 'ldb."d_fmr_cio_group_c" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.mdm_key = a15.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a15.fmr_product_c_key = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.cost_center_c_key = a18.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY) join "ldb"."d_fmr_business_group_c" a110
on (a19.fmr_business_group_c_key = a110.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a111
on (a110.fmr_operating_committee_c_key = a111.ROW_KEY)
join "ldb"."d_fmr_cio_group_c" a112
on (a111.fmr_cio_group_c_key = a112.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."D_CHANGE_REQUEST" a113
on (a11.CHANGE_REQUEST_KEY = a113.ROW_KEY)
union
select 'ldb."D_OUTAGE" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."D_OUTAGE" a114
on (a11.OUTAGE_KEY = a114.ROW_KEY)
union
select 'ldb."D_INCIDENT" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."D_INCIDENT" a115
on (a11.INCIDENT_KEY = a115.ROW_KEY)
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
select 'ldb."D_PROBLEM" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."D_PROBLEM" a118
on (a11.PROBLEM_KEY = a118.ROW_KEY)
union
select 'ldb."d_change_request_caused_by_type" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_change_request_caused_by" a13
on (a11.CAUSED_BY_CHANGE_KEY = a13.ROW_KEY)
join "ldb"."d_change_request_caused_by_type" a119
on (a13.TYPE_SRC_KEY = a119.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_configuration_item" a14
on (a11.CONFIGURATION_ITEM_KEY = a14.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a120
on (a14.mdm_key = a120.ROW_KEY)
union
select 'ldb."d_incident_priority" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."D_INCIDENT" a115
on (a11.INCIDENT_KEY = a115.ROW_KEY)
join "ldb"."d_incident_priority" a121
on (a115.PRIORITY_SRC_KEY = a121.ROW_KEY)
union
select 'ldb."d_outage_type" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."D_OUTAGE" a114
on (a11.OUTAGE_KEY = a114.ROW_KEY)
join "ldb"."d_outage_type" a122
on (a114.OUTAGE_TYPE_SRC_KEY = a122.ROW_KEY)
union
select 'ldb."d_cio_group_status_c" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_APPL_HIERARCHY_TASK_DETAILS_C" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY) join "ldb"."d_application_mdm" a15
on (a12.mdm_key = a15.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a15.fmr_product_c_key = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.cost_center_c_key = a18.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY) join "ldb"."d_fmr_business_group_c" a110
on (a19.fmr_business_group_c_key = a110.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a111
on (a110.fmr_operating_committee_c_key = a111.ROW_KEY) join "ldb"."d_fmr_cio_group_c" a112
on (a111.fmr_cio_group_c_key = a112.ROW_KEY)
join "ldb"."d_cio_group_status_c" a123
on (a112.cio_group_status_c_key = a123.ROW_KEY)