select 'ldb."n_incident_monthly" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
union
select 'ldb."d_incident_configuration_item_snapshot" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_incident_configuration_item_snapshot" a12
on (a11.incident_configuration_item_snapshot_key = a12.ROW_KEY)
union
select 'ldb."d_incident_employee_snapshot" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_incident_employee_snapshot" a13
on (a11.incident_employee_snapshot_key = a13.ROW_KEY)
union
select 'ldb."d_incident_date_snapshot" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_incident_date_snapshot" a14
on (a11.incident_date_snapshot_key = a14.ROW_KEY)
union
select 'ldb."d_incident_assigned_to_snapshot" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_incident_assigned_to_snapshot" a15
on (a11.incident_assigned_to_snapshot_key = a15.ROW_KEY)
union
select 'ldb."d_incident_assignment_group_snapshot" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_incident_assignment_group_snapshot" a16
on (a11.incident_assignment_group_snapshot_key = a16.ROW_KEY)
union
select 'ldb."d_internal_organization_department_snapshot" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_internal_organization_department_snapshot" a17
on (a11.opened_by_department_key = a17.ROW_KEY)
union
select 'ldb."d_incident_business_service_snapshot" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_incident_business_service_snapshot" a18
on (a11.incident_business_service_snapshot_key = a18.ROW_KEY)
union
select 'ldb."d_incident_category_snapshot" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_incident_category_snapshot" a19
on (a11.CATEGORY_SRC_KEY = a19.ROW_KEY)
union
select 'ldb."d_incident_configuration_item_mdm_snapshot" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_incident_configuration_item_snapshot" a12
on (a11.incident_configuration_item_snapshot_key = a12.ROW_KEY)
join "ldb"."d_incident_configuration_item_mdm_snapshot" a110
on (a12.mdm_key = a110.ROW_KEY)
union
select 'ldb."d_incident_employee_mdm_snapshot" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_incident_employee_snapshot" a13
on (a11.incident_employee_snapshot_key = a13.ROW_KEY)
join "ldb"."d_incident_employee_mdm_snapshot" a111
on (a13.employee_mdm_key = a111.ROW_KEY)
union
select 'ldb."d_incident_month_snapshot" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_incident_date_snapshot" a14
on (a11.incident_date_snapshot_key = a14.ROW_KEY)
join "ldb"."d_incident_month_snapshot" a112
on (a14.month_start_date_key = a112.ROW_KEY)
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
union
select 'ldb."d_incident_assignment_group_manager_snapshot" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_incident_monthly" a11
join "ldb"."d_incident_assignment_group_snapshot" a16
on (a11.incident_assignment_group_snapshot_key = a16.ROW_KEY)
join "ldb"."d_incident_assignment_group_manager_snapshot" a115
on (a16.manager_key = a115.ROW_KEY)