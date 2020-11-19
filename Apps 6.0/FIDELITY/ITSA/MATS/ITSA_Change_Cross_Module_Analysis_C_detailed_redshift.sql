select 'ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
union
select 'ldb."d_change_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_date" a12
on (a11.CHANGE_DATE_KEY = a12.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
union
select 'ldb."d_calendar_date" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_calendar_date" a14
on (a11.DATE_KEY = a14.ROW_KEY)
union
select 'ldb."d_change_application_c" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."d_change_application_c" a15
on (a13.APPLICATION_C_KEY = a15.ROW_KEY)
union
select 'ldb."d_change_request_risk" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_risk" a16
on (a11.RISK_SRC_KEY = a16.ROW_KEY)
union
select 'ldb."d_configuration_item" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_configuration_item" a17
on (a11.CONFIGURATION_ITEM_KEY = a17.ROW_KEY)
union
select 'ldb."d_calendar_month" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_calendar_date" a14
on (a11.DATE_KEY = a14.ROW_KEY)
join "ldb"."d_calendar_month" a18
on (a14.month_start_date_key = a18.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_internal_organization_group" a19
on (a11.ASSIGNMENT_GROUP_KEY = a19.ROW_KEY)
union
select 'ldb."d_change_calendar_month" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_date" a12
on (a11.CHANGE_DATE_KEY = a12.ROW_KEY)
join "ldb"."d_change_calendar_month" a110
on (a12.month_start_date_key = a110.ROW_KEY)
union
select 'ldb."d_change_request_impact" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_impact" a111
on (a11.IMPACT_SRC_KEY = a111.ROW_KEY)
union
select 'ldb."d_change_request_type" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_type" a112
on (a11.TYPE_SRC_KEY = a112.ROW_KEY)
union
select 'ldb."d_internal_organization_bu_oversight_group_c" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."d_internal_organization_bu_oversight_group_c" a113
on (a13.BU_OVERSIGHT_GROUP_C_KEY = a113.ROW_KEY)
union
select 'ldb."d_change_request_close_code" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."d_change_request_close_code" a114
on (a13.CLOSE_CODE_SRC_KEY = a114.ROW_KEY)
union
select 'ldb."d_lov_change_trigger_c" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."d_lov_change_trigger_c" a115
on (a13.CHANGE_TRIGGER_SRC_C_KEY = a115.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_configuration_item" a17
on (a11.CONFIGURATION_ITEM_KEY = a17.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a116
on (a17.mdm_key = a116.ROW_KEY)
union
select 'ldb."d_lov_change_environment_c" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."d_lov_change_environment_c" a117
on (a13.CHANGE_ENVIRONMENT_SRC_C_KEY = a117.ROW_KEY)