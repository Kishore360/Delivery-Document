select 'ldb."f_incident_resolved" a11 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
union 
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_application" a12 
on (a11.APPLICATION_KEY = a12.ROW_KEY) 
union 
select 'ldb."d_application_mdm" a13 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_application" a12 
on (a11.APPLICATION_KEY = a12.ROW_KEY) 
join "ldb"."d_application_mdm" a13 
on (a12.mdm_key = a13.ROW_KEY) 
union 
select 'ldb."d_internal_contact_assigned_to" a14 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_internal_contact_assigned_to" a14 
on (a11.ASSIGNED_TO_KEY = a14.ROW_KEY) 
union 
select 'ldb."d_internal_organization_group" a15 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_internal_organization_group" a15 
on (a11.ASSIGNMENT_GROUP_KEY = a15.ROW_KEY) 
union 
select 'ldb."D_INCIDENT" a16 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
union 
select 'ldb."d_calendar_date" a17 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_calendar_date" a17 
on (a11.date_key = a17.ROW_KEY) 
union 
select 'ldb."d_calendar_month" a18 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_calendar_date" a17 
on (a11.date_key = a17.ROW_KEY) 
join "ldb"."d_calendar_month" a18 
on (a17.month_start_date_key = a18.ROW_KEY) 
union 
select 'ldb."d_calendar_quarter" a19 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_calendar_date" a17 
on (a11.date_key = a17.ROW_KEY)
join "ldb"."d_calendar_month" a18 
on (a17.month_start_date_key = a18.ROW_KEY) 
join "ldb"."d_calendar_quarter" a19 
on (a18.quarter_start_date_key = a19.ROW_KEY) 
union 
select 'ldb."d_configuration_item" a110 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_configuration_item" a110 
on (a11.CONFIGURATION_ITEM_KEY = a110.ROW_KEY) 
union 
select 'ldb."d_configuration_item_mdm" a111 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_configuration_item" a110 
on (a11.CONFIGURATION_ITEM_KEY = a110.ROW_KEY) 
join "ldb"."d_configuration_item_mdm" a111 
on (a110.mdm_key = a111.ROW_KEY) 
union 
select 'ldb."d_internal_contact" a112 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_internal_contact" a112 
on (a11.employee_key = a112.ROW_KEY) 
union 
select 'ldb."d_calendar_time" a113 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_calendar_time" a113 
on (a11.time_key = a113.ROW_KEY) 
union 
select 'ldb."d_lov_incident_impacted_audience_c" a114 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_lov_incident_impacted_audience_c" a114 
on (a16.IMPACTED_AUDIENCE_SRC_C_KEY = a114.ROW_KEY) 
union 
select 'ldb."d_incident_application_c" a115 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_incident_application_c" a115 
on (a16.APPLICATION_C_KEY = a115.ROW_KEY) 
union 
select 'ldb."d_incident_assignment_group_c" a116 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_incident_assignment_group_c" a116 
on (a16.ASSIGNMENT_GROUP_C_KEY = a116.ROW_KEY) 
union 
select 'ldb."d_incident_configuration_item_c" a117 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_incident_configuration_item_c" a117 
on (a16.CONFIGURATION_ITEM_C_KEY = a117.ROW_KEY) 
union 
select 'ldb."d_calendar_week" a118 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_calendar_date" a17 
on (a11.date_key = a17.ROW_KEY) 
join "ldb"."d_calendar_week" a118 
on (a17.week_start_date_key = a118.ROW_KEY) 
union 
select 'ldb."d_calendar_year" a119 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_calendar_date" a17 
on (a11.date_key = a17.ROW_KEY) join "ldb"."d_calendar_month" a18 
on (a17.month_start_date_key = a18.ROW_KEY) 
join "ldb"."d_calendar_quarter" a19 
on (a18.quarter_start_date_key = a19.ROW_KEY) 
join "ldb"."d_calendar_year" a119 
on (a19.year_start_date_key = a119.ROW_KEY) 
union 
select 'ldb."d_parent_incident" a120 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_parent_incident" a120 
on (a16.PARENT_INCIDENT_KEY = a120.ROW_KEY) 
union 
select 'ldb."D_PROBLEM" a121 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_PROBLEM" a121 
on (a11.PROBLEM_KEY = a121.ROW_KEY) 
union 
select 'ldb."d_change_request_caused_by" a122 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_change_request_caused_by" a122 
on (a11.caused_by_change_key = a122.ROW_KEY) 
union 
select 'ldb."d_incident_contacttype" a123 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_incident_contacttype" a123 
on (a11.reported_type_src_key = a123.ROW_KEY) 
union 
select 'ldb."d_incident_impact" a124 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_incident_impact" a124 
on (a11.impact_src_key = a124.ROW_KEY) 
union 
select 'ldb."d_internal_contact_major_incident_manager_c" a125 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_internal_contact_major_incident_manager_c" a125 
on (a11.major_incident_manager_c_key = a125.ROW_KEY) 
union 
select 'ldb."d_incident_urgency" a126 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_incident_urgency" a126 
on (a11.urgency_src_key = a126.ROW_KEY) 
union 
select 'ldb."d_location" a127 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_location" a127 
on (a11.LOCATION_KEY = a127.ROW_KEY) 
union 
select 'ldb."d_assignment_group_manager" a128 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_internal_organization_group" a15 
on (a11.ASSIGNMENT_GROUP_KEY = a15.ROW_KEY) 
join "ldb"."d_assignment_group_manager" a128 
on (a15.assignment_group_manager_key = a128.ROW_KEY) 
union 
select 'ldb."d_problem_type_and_symptoms_c" a129 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_problem_type_and_symptoms_c" a129 
on (a16.PROBLEM_TYPE_AND_SYMPTOMS_C_KEY = a129.ROW_KEY) 
union 
select 'ldb."d_lov_incident_discovery_method_c" a130 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_lov_incident_discovery_method_c" a130 
on (a16.DISCOVERY_METHOD_SRC_C_KEY = a130.ROW_KEY) 
union 
select 'ldb."d_internal_contact_mdm" a131 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_internal_contact" a112 
on (a11.employee_key = a112.ROW_KEY) 
join "ldb"."d_internal_contact_mdm" a131 
on (a112.employee_mdm_key = a131.ROW_KEY) 
union 
select 'ldb."d_lov_incident_environment_c" a132 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_lov_incident_environment_c" a132 
on (a16.ENVIRONMENT_SRC_C_KEY = a132.ROW_KEY) 
union 
select 'ldb."d_calendar_time_hour" a133 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."d_calendar_time" a113 
on (a11.time_key = a113.ROW_KEY) 
join "ldb"."d_calendar_time_hour" a133 
on (a113.hour_key = a133.ROW_KEY) 
union 
select 'ldb."d_incident_caller" a134 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_incident_caller" a134 
on (a16.CALLER_KEY = a134.ROW_KEY) 
union 
select 'ldb."d_incident_category" a135 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_incident_category" a135 
on (a16.CATEGORY_SRC_KEY = a135.ROW_KEY) 
union 
select 'ldb."d_incident_close_code" a136 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_incident_close_code" a136 
on (a16.CLOSE_CODE_SRC_KEY = a136.ROW_KEY) 
union 
select 'ldb."d_incident_priority" a137 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_incident_priority" a137 
on (a16.PRIORITY_SRC_KEY = a137.ROW_KEY) 
union 
select 'ldb."d_incident_state" a138 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_incident_state" a138 
on (a16.STATE_SRC_KEY = a138.ROW_KEY) 
union 
select 'ldb."d_incident_subcategory" a139 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_incident_subcategory" a139 
on (a16.SUB_CATEGORY_SRC_KEY = a139.ROW_KEY) 
union 
select 'ldb."d_lov_incident_loss_of_service_c" a140 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_lov_incident_loss_of_service_c" a140 
on (a16.LOSS_OF_SERVICE_SRC_C_KEY = a140.ROW_KEY) 
union 
select 'ldb."d_internal_contact_on_behalf_of_c" a141 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_internal_contact_on_behalf_of_c" a141 
on (a16.INCIDENT_ON_BEHALF_C_KEY = a141.ROW_KEY) 
union 
select 'ldb."d_internal_organization_originating_group_c" a142 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_internal_organization_originating_group_c" a142 
on (a16.ORIGINATING_GROUP_C_KEY = a142.ROW_KEY) 
union 
select 'ldb."d_lov_vendor_related_c" a143 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 
join "ldb"."D_INCIDENT" a16 
on (a11.INCIDENT_KEY = a16.ROW_KEY) 
join "ldb"."d_lov_vendor_related_c" a143 
on (a16.VENDOR_RELATED_C_KEY = a143.ROW_KEY) 
union 
select 'ldb.lagging_count_of_month_d between 0 and 12 ' as Table_name, count(a11.row_key) Row_Count 
from ldb."f_incident_resolved" a11 