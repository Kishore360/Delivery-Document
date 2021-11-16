select 'dw."f_incident_closed" "a11" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"
union
select 'dw."d_incident_time" "a12" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident_time" "a12"
on ("a11"."incident_time_key" = "a12"."ROW_KEY")
union
select 'dw."d_incident_employee" "a13" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident_employee" "a13"
on ("a11"."incident_employee_key" = "a13"."ROW_KEY")
union
select 'dw."d_incident" "a14" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")
union
select 'dw."d_incident_application" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_application" "a15"
on ("a14"."APPLICATION_KEY" = "a15"."ROW_KEY")
union
select 'dw."d_incident_assigned_to" "a16" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_assigned_to" "a16"
on ("a14"."ASSIGNED_TO_KEY" = "a16"."ROW_KEY")
union
select 'dw."d_incident_assignment_group" "a17" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"


join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_assignment_group" "a17"
on ("a14"."ASSIGNMENT_GROUP_KEY" = "a17"."ROW_KEY")
union
select 'dw."d_incident_business_service" "a18" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_business_service" "a18"
on ("a14"."BUSINESS_SERVICE_KEY" = "a18"."ROW_KEY")
union
select 'dw."d_incident_date" "a19" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident_date" "a19"
on ("a11"."incident_date_key" = "a19"."ROW_KEY")
union
select 'dw."d_incident_calendar_month" "a110" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident_date" "a19"
on ("a11"."incident_date_key" = "a19"."ROW_KEY")

join "dw"."d_incident_calendar_month" "a110"
on ("a19"."month_start_date_key" = "a110"."ROW_KEY")
union
select 'dw."d_incident_calendar_quarter" "a111" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident_date" "a19"
on ("a11"."incident_date_key" = "a19"."ROW_KEY")

join "dw"."d_incident_calendar_month" "a110"
on ("a19"."month_start_date_key" = "a110"."ROW_KEY")

join "dw"."d_incident_calendar_quarter" "a111"
on ("a110"."quarter_start_date_key" = "a111"."ROW_KEY")
union
select 'dw."d_incident_rfc" "a112" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_rfc" "a112"
on ("a14"."CHANGE_REQUEST_KEY" = "a112"."ROW_KEY")
union
select 'dw."d_configuration_item_incident" "a113" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_configuration_item_incident" "a113"
on ("a14"."CONFIGURATION_ITEM_KEY" = "a113"."ROW_KEY")
union
select 'dw."d_incident_configuration_item_mdm" "a114" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_configuration_item_incident" "a113"
on ("a14"."CONFIGURATION_ITEM_KEY" = "a113"."ROW_KEY")

join "dw"."d_incident_configuration_item_mdm" "a114"
on ("a113"."mdm_key" = "a114"."ROW_KEY")
union
select 'dw."d_incident_customer" "a115" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_customer" "a115"
on ("a14"."CUSTOMER_KEY" = "a115"."ROW_KEY")
union
select 'dw."d_incident_priority" "a116" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_priority" "a116"
on ("a14"."PRIORITY_SRC_KEY" = "a116"."ROW_KEY")
union
select 'dw."d_incident_state" "a117" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_state" "a117"
on ("a14"."STATE_SRC_KEY" = "a117"."ROW_KEY")
union
select 'dw."d_parent_incident" "a118" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_parent_incident" "a118"
on ("a14"."PARENT_INCIDENT_KEY" = "a118"."ROW_KEY")
union
select 'dw."d_incident_calendar_hour" "a119" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"


join "dw"."d_incident_time" "a12"
on ("a11"."incident_time_key" = "a12"."ROW_KEY")

join "dw"."d_incident_calendar_hour" "a119"
on ("a12"."hour_key" = "a119"."ROW_KEY")
union
select 'dw."d_incident_caused_by_change" "a120" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident_caused_by_change" "a120"
on ("a11"."INCIDENT_CAUSED_BY_CHANGE_KEY" = "a120"."ROW_KEY")
union
select 'dw."d_incident_contacttype" "a121" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident_contacttype" "a121"
on ("a11"."REPORTED_TYPE_SRC_KEY" = "a121"."ROW_KEY")
union
select 'dw."d_incident_department" "a122" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident_employee" "a13"
on ("a11"."incident_employee_key" = "a13"."ROW_KEY")

join "dw"."d_incident_department" "a122"
on ("a13"."department_key" = "a122"."ROW_KEY")
union
select 'dw."d_incident_employee_mdm" "a123" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident_employee" "a13"
on ("a11"."incident_employee_key" = "a13"."ROW_KEY")

join "dw"."d_incident_employee_mdm" "a123"
on ("a13"."employee_mdm_key" = "a123"."ROW_KEY")
union
select 'dw."d_incident_impact" "a124" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident_impact" "a124"
on ("a11"."IMPACT_SRC_KEY" = "a124"."ROW_KEY")
union
select 'dw."d_incident_urgency" "a125" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident_urgency" "a125"
on ("a11"."URGENCY_SRC_KEY" = "a125"."ROW_KEY")
union
select 'dw."d_incident_application_mdm" "a126" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"


join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_application" "a15"
on ("a14"."APPLICATION_KEY" = "a15"."ROW_KEY")

join "dw"."d_incident_application_mdm" "a126"
on ("a15"."mdm_key" = "a126"."ROW_KEY")
union
select 'dw."d_incident_calendar_week" "a127" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident_date" "a19"
on ("a11"."incident_date_key" = "a19"."ROW_KEY")

join "dw"."d_incident_calendar_week" "a127"
on ("a19"."week_start_date_key" = "a127"."ROW_KEY")
union
select 'dw."d_incident_category" "a128" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_category" "a128"
on ("a14"."CATEGORY_SRC_KEY" = "a128"."ROW_KEY")
union
select 'dw."d_incident_close_code" "a129" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_close_code" "a129"
on ("a14"."CLOSE_CODE_SRC_KEY" = "a129"."ROW_KEY")
union
select 'dw."d_incident_company" "a130" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_company" "a130"
on ("a14"."COMPANY_KEY" = "a130"."ROW_KEY")
union



select 'dw."d_incident_customer" "a115" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_customer" "a115"
on ("a14"."CUSTOMER_KEY" = "a115"."ROW_KEY")


join "dw"."d_incident_customer_mdm" "a131"
on ("a115"."customer_mdm_key" = "a131"."ROW_KEY")
union
select 'dw."d_incident_domain" "a132" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_domain" "a132"
on ("a14"."DOMAIN_KEY" = "a132"."ROW_KEY")
union
select 'dw."d_incident_location" "a133" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_location" "a133"
on ("a14"."LOCATION_KEY" = "a133"."ROW_KEY")
union
select 'dw."d_task_sla_resolution_flag" "a134" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_task_sla_resolution_flag" "a134"
on ("a14"."met_resolution_sla_flag_key" = "a134"."ROW_KEY")
union
select 'dw."d_task_sla_response_flag" "a135" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_task_sla_response_flag" "a135"
on ("a14"."met_response_sla_flag_key" = "a135"."ROW_KEY")
union
select 'dw."d_incident_severity" "a136" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"


join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_severity" "a136"
on ("a14"."SEVERITY_SRC_KEY" = "a136"."ROW_KEY")
union
select 'dw."d_incident_subcategory" "a137" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"


join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_subcategory" "a137"
on ("a14"."SUB_CATEGORY_SRC_KEY" = "a137"."ROW_KEY")
union
select 'dw."d_incident_assignment_group_manager" "a138" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")


join "dw"."d_incident_assignment_group" "a17"
on ("a14"."ASSIGNMENT_GROUP_KEY" = "a17"."ROW_KEY")

join "dw"."d_incident_assignment_group_manager" "a138"
on ("a17"."manager_key" = "a138"."ROW_KEY")
union
select 'dw."d_incident_business_service_criticality" "a139" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_business_service" "a18"
on ("a14"."BUSINESS_SERVICE_KEY" = "a18"."ROW_KEY")


join "dw"."d_incident_business_service_criticality" "a139"
on ("a18"."criticality_key" = "a139"."ROW_KEY")
union
select 'dw."d_incident_business_service_used_for" "a140" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident" "a14"
on ("a11"."INCIDENT_KEY" = "a14"."ROW_KEY")

join "dw"."d_incident_business_service" "a18"
on ("a14"."BUSINESS_SERVICE_KEY" = "a18"."ROW_KEY")

join "dw"."d_incident_business_service_used_for" "a140"
on ("a18"."used_for_src_key" = "a140"."ROW_KEY")
union
select 'dw."d_incident_calendar_year" "a141" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_incident_closed" "a11"

join "dw"."d_incident_date" "a19"
on ("a11"."incident_date_key" = "a19"."ROW_KEY")

join "dw"."d_incident_calendar_month" "a110"
on ("a19"."month_start_date_key" = "a110"."ROW_KEY")

join "dw"."d_incident_calendar_quarter" "a111"
on ("a110"."quarter_start_date_key" = "a111"."ROW_KEY")

join "dw"."d_incident_calendar_year" "a141"
on ("a111"."year_start_date_key" = "a141"."ROW_KEY")