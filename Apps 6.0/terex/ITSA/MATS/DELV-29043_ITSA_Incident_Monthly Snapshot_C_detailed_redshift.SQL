select 'ldb."n_incident_monthly" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_internal_contact" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_internal_contact" a14
on (a11.EMPLOYEE_KEY = a14.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_internal_contact_assigned_to" a15
on (a11.ASSIGNED_TO_KEY = a15.ROW_KEY)
union
select 'ldb."D_INTERNAL_ORGANIZATION_GROUP" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."D_INTERNAL_ORGANIZATION_GROUP" a16
on (a11.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
union
select 'ldb."d_business_service" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_business_service" a17
on (a11.BUSINESS_SERVICE_KEY = a17.ROW_KEY)
union
select 'ldb."d_calendar_month" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
join "ldb"."d_calendar_month" a18
on (a12.month_start_date_key = a18.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a19
on (a13.mdm_key = a19.ROW_KEY)
union
select 'ldb."d_internal_organization_department_snapshot" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_internal_organization_department_snapshot" a110
on (a11.OPENED_BY_DEPARTMENT_KEY = a110.ROW_KEY)
union
select 'ldb."d_internal_contact_mdm" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_internal_contact" a14
on (a11.EMPLOYEE_KEY = a14.ROW_KEY)
join "ldb"."d_internal_contact_mdm" a111
on (a14.employee_mdm_key = a111.ROW_KEY)
union
select 'ldb."d_incident_category_snapshot" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_incident_category_snapshot" a112
on (a11.CATEGORY_SRC_KEY = a112.ROW_KEY)
union
select 'ldb."d_incident_priority" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_incident_priority" a113
on (a11.PRIORITY_SRC_KEY = a113.ROW_KEY)
union
select 'ldb."d_incident_state_snapshot" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_incident_state_snapshot" a114
on (a11.STATE_SRC_KEY = a114.ROW_KEY)
UNION 
select 'ldb."D_MOC_INC_MONTHLY_SNAPSHOT_C" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."D_MOC_INC_MONTHLY_SNAPSHOT_C" a114
on (a11.snap_seg_group_c_key = a114.ROW_KEY)