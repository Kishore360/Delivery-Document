select 'ldb."f_task_closed" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_internal_contact" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_internal_contact" a14
on (a11.EMPLOYEE_KEY = a14.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_internal_contact_assigned_to" a15
on (a11.ASSIGNED_TO_KEY = a15.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_internal_organization_group" a16
on (a11.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
union
select 'ldb."d_calendar_date" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
union
select 'ldb."d_task" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_task" a18
on (a11.task_key = a18.ROW_KEY)
union
select 'ldb."d_parent_task" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_task" a18
on (a11.task_key = a18.ROW_KEY)
join "ldb"."d_parent_task" a19
on (a18.parent_task_key = a19.ROW_KEY)
union
select 'ldb."d_application_mdm" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a110
on (a12.mdm_key = a110.ROW_KEY)
union
select 'ldb."d_business_service" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_business_service" a111
on (a11.BUSINESS_SERVICE_KEY = a111.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a112
on (a13.mdm_key = a112.ROW_KEY)
union
select 'ldb."d_internal_contact_mdm" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_internal_contact" a14
on (a11.EMPLOYEE_KEY = a14.ROW_KEY)
join "ldb"."d_internal_contact_mdm" a113
on (a14.employee_mdm_key = a113.ROW_KEY)
union
select 'ldb."d_location" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_location" a114
on (a11.LOCATION_KEY = a114.ROW_KEY)
union
select 'ldb."d_assignment_group_manager" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_internal_organization_group" a16
on (a11.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
join "ldb"."d_assignment_group_manager" a115
on (a16.assignment_group_manager_key = a115.ROW_KEY)
union
select 'ldb."d_calendar_month" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
join "ldb"."d_calendar_month" a116
on (a17.month_start_date_key = a116.ROW_KEY)
union
select 'ldb."d_task_approval" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_task" a18
on (a11.task_key = a18.ROW_KEY)
join "ldb"."d_task_approval" a117
on (a18.approval_src_key = a117.ROW_KEY)
union
select 'ldb."d_task_closed_by" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_task" a18
on (a11.task_key = a18.ROW_KEY)
join "ldb"."d_task_closed_by" a118
on (a18.CLOSED_BY_KEY = a118.ROW_KEY)
union
select 'ldb."d_task_contacttype" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_task" a18
on (a11.task_key = a18.ROW_KEY)
join "ldb"."d_task_contacttype" a119
on (a18.contact_type_src_key = a119.ROW_KEY)
union
select 'ldb."d_task_impact" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_task" a18
on (a11.task_key = a18.ROW_KEY)
join "ldb"."d_task_impact" a120
on (a18.IMPACT_SRC_KEY = a120.ROW_KEY)
union
select 'ldb."d_task_opened_by" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_task" a18
on (a11.task_key = a18.ROW_KEY)
join "ldb"."d_task_opened_by" a121
on (a18.OPENED_BY_KEY = a121.ROW_KEY)
union
select 'ldb."d_task_priority" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_task" a18
on (a11.task_key = a18.ROW_KEY)
join "ldb"."d_task_priority" a122
on (a18.PRIORITY_SRC_KEY = a122.ROW_KEY)
union
select 'ldb."d_task_state" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_task" a18
on (a11.task_key = a18.ROW_KEY)
join "ldb"."d_task_state" a123
on (a18.STATE_SRC_KEY = a123.ROW_KEY)
union
select 'ldb."d_task_type" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_task" a18
on (a11.task_key = a18.ROW_KEY)
join "ldb"."d_task_type" a124
on (a18.task_type_src_key = a124.ROW_KEY)
union
select 'ldb."d_task_urgency" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_task_closed" a11
join "ldb"."d_task" a18
on (a11.task_key = a18.ROW_KEY)
join "ldb"."d_task_urgency" a125
on (a18.URGENCY_SRC_KEY = a125.ROW_KEY)