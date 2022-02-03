select 'dw."f_change_request" "a11" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
union
select 'dw."d_change_request" "a13" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request" "a13" on ("a11"."change_request_key" = "a13"."row_key")
UNION 
select 'dw."d_change_request_approval" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request" "a13" on ("a11"."change_request_key" = "a13"."row_key")
join  "dw"."d_change_request_approval" "a14" on ("a13"."approval_state_src_key" = "a14"."row_key")
UNION 
select 'dw."d_change_employee" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join "dw"."d_change_employee"	"a12" on ("a11"."change_employee_key" = "a12"."row_key")
UNION 
select 'dw."d_change_date" "a15" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join "dw"."d_change_date"	"a15" on 	("a11"."change_date_key" = "a15"."row_key")
UNION 
select 'dw."d_change_calendar_week" "a15" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join "dw"."d_change_date"	"a15" on 	("a11"."change_date_key" = "a15"."row_key")
join	"dw"."d_change_calendar_week"	"a146" on 	("a15"."week_start_date_key" = "a146"."row_key")
UNION 
select 'dw."d_change_calendar_month" "a16" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join "dw"."d_change_date"	"a15" on 	("a11"."change_date_key" = "a15"."row_key")
join "dw"."d_change_calendar_month"	"a16" on 	("a15"."month_start_date_key" = "a16"."row_key")
UNION 
select 'dw."d_change_calendar_quarter" "a16" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join "dw"."d_change_date"	"a15" on 	("a11"."change_date_key" = "a15"."row_key")
join "dw"."d_change_calendar_month"	"a16" on 	("a15"."month_start_date_key" = "a16"."row_key")
join	"dw"."d_change_calendar_quarter"	"a130" on 	("a16"."quarter_start_date_key" = "a130"."row_key")
UNION 
select 'dw."d_change_calendar_year" "a16" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join "dw"."d_change_date"	"a15" on 	("a11"."change_date_key" = "a15"."row_key")
join "dw"."d_change_calendar_month"	"a16" on 	("a15"."month_start_date_key" = "a16"."row_key")
join	"dw"."d_change_calendar_quarter"	"a130" on 	("a16"."quarter_start_date_key" = "a130"."row_key")
join	"dw"."d_change_calendar_year"	"a156" on 	("a130"."year_start_date_key" = "a156"."row_key")
UNION 
select 'dw."d_change_request_assignment_group" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request" "a13" on ("a11"."change_request_key" = "a13"."row_key")
join	"dw"."d_change_request_assignment_group"	"a125" on 	("a13"."assignment_group_key" = "a125"."row_key")
UNION 
select 'dw."d_h_change_assignment_group" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request" "a13" on ("a11"."change_request_key" = "a13"."row_key")
join	"dw"."d_change_request_assignment_group"	"a125" on 	("a13"."assignment_group_key" = "a125"."row_key")
join	"dw"."d_h_change_assignment_group"	"a126" on 	("a125"."group_hierarchy_key" = "a126"."row_key")
UNION 
select 'dw."d_change_business_service" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request" "a13" on ("a11"."change_request_key" = "a13"."row_key")
join	"dw"."d_change_business_service"	"a127" on 	("a13"."business_service_key" = "a127"."row_key")
UNION 
select 'dw."d_change_request_urgency" "a13" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request_urgency" "a13" on ("a11"."urgency_src_key" = "a13"."row_key")
UNION 
select 'dw."d_change_request_scope" "a13" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request_scope" "a13" on ("a11"."scope_src_key" = "a13"."row_key")
UNION 
select 'dw."d_change_request_risk" "a13" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request_risk" "a13" on ("a11"."risk_src_key" = "a13"."row_key")
UNION 
select 'dw."d_change_request_review_status" "a13" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request_review_status" "a13" on ("a11"."review_status_src_key" = "a13"."row_key")
UNION 
select 'dw."d_change_request_reported_type" "a13" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request_reported_type" "a13" on ("a11"."reported_type_src_key" = "a13"."row_key")
UNION 
select 'dw."d_change_request_reason" "a13" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request_reason" "a13" on ("a11"."reason_src_key" = "a13"."row_key")
UNION 
select 'dw."d_change_request_priority" "a13" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request_priority" "a13" on ("a11"."priority_src_key" = "a13"."row_key")
UNION 
select 'dw."d_change_request_impact" "a13" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request_impact" "a13" on ("a11"."impact_src_key" = "a13"."row_key")
UNION 
select 'dw."d_change_request_category" "a13" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request_category" "a13" on ("a11"."category_src_key" = "a13"."row_key")
UNION 
select 'dw."d_change_request_type" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request" "a13" on ("a11"."change_request_key" = "a13"."row_key")
join	"dw"."d_change_request_type"	"a150" on 	("a13"."type_src_key" = "a150"."row_key")
UNION 
select 'dw."d_change_request_state" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request" "a13" on ("a11"."change_request_key" = "a13"."row_key")
join	"dw"."d_change_request_state"	"a15" on 	("a13"."state_src_key" = "a15"."row_key")
UNION 
select 'dw."d_change_location" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request" "a13" on ("a11"."change_request_key" = "a13"."row_key")
join	"dw"."d_change_location"	"a149"  on 	("a13"."location_key" = "a149"."row_key")
UNION 
select 'dw."d_change_internal_contact_assigned_to" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request" "a13" on ("a11"."change_request_key" = "a13"."row_key")
join	"dw"."d_change_internal_contact_assigned_to"	"a124" on 	("a13"."assigned_to_key" = "a124"."row_key")
UNION 
select 'dw."d_change_employee" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join	"dw"."d_change_employee"	"a12" on 	("a11"."change_employee_key" = "a12"."row_key")
UNION 
select 'dw."d_change_employee_mdm" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join	"dw"."d_change_employee"	"a12" on 	("a11"."change_employee_key" = "a12"."row_key")
join	"dw"."d_change_employee_mdm"	"a137" ON ("a12"."employee_mdm_key" = "a137"."row_key")
UNION 
select 'dw."d_change_domain" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join	"dw"."d_change_request"	"a12" on 	("a11"."change_request_key" = "a12"."row_key")
join	"dw"."d_change_domain"	"a137" ON ("a12"."domain_key" = "a137"."row_key")
UNION 
select 'dw."d_change_department" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join	"dw"."d_change_request"	"a12" on 	("a11"."change_request_key" = "a12"."row_key")
join	"dw"."d_change_department"	"a137" ON ("a12"."requested_by_department_key" = "a137"."row_key")
UNION 
select 'dw."d_change_configuration_item" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join	"dw"."d_change_request"	"a12" on 	("a11"."change_request_key" = "a12"."row_key")
join	"dw"."d_change_configuration_item"	"a131" on 	("a12"."configuration_item_key" = "a131"."row_key")
UNION 
select 'dw."d_change_configuration_item_mdm" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join	"dw"."d_change_request"	"a12" on 	("a11"."change_request_key" = "a12"."row_key")
join	"dw"."d_change_configuration_item"	"a131" on 	("a12"."configuration_item_key" = "a131"."row_key")
join	"dw"."d_change_configuration_item_mdm"	"a132" on 	("a131"."mdm_key" = "a132"."row_key")
UNION 
select 'dw."d_change_business_service" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join	"dw"."d_change_request"	"a12" on 	("a11"."change_request_key" = "a12"."row_key")
join	"dw"."d_change_business_service"	"a127" on 	("a12"."business_service_key" = "a127"."row_key")
UNION 
select 'dw."d_change_business_service_criticality" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join	"dw"."d_change_request"	"a12" on 	("a11"."change_request_key" = "a12"."row_key")
join	"dw"."d_change_business_service"	"a127" on 	("a12"."business_service_key" = "a127"."row_key")
join	"dw"."d_change_business_service_criticality"	"a154" on 	("a127"."criticality_key" = "a154"."row_key")
UNION 
select 'dw."d_change_business_service_used_for" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join	"dw"."d_change_request"	"a12" on 	("a11"."change_request_key" = "a12"."row_key")
join	"dw"."d_change_business_service"	"a127" on 	("a12"."business_service_key" = "a127"."row_key")
join	"dw"."d_change_business_service_used_for"	"a155" on 	("a127"."used_for_src_key" = "a155"."row_key")
UNION 
select 'dw."d_change_application" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join	"dw"."d_change_request"	"a12" on 	("a11"."change_request_key" = "a12"."row_key")
join	"dw"."d_change_application"	"a123"  on 	("a12"."application_key" = "a123"."row_key")
UNION 
select 'dw."d_change_application_mdm" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join	"dw"."d_change_request"	"a12" on 	("a11"."change_request_key" = "a12"."row_key")
join	"dw"."d_change_application"	"a123"  on 	("a12"."application_key" = "a123"."row_key")
join	"dw"."d_change_application_mdm"	"a144" on 	("a123"."mdm_key" = "a144"."row_key")
UNION 
select 'dw."d_change_assignment_group_manager" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request" "a13" on ("a11"."change_request_key" = "a13"."row_key")
join	"dw"."d_change_request_assignment_group"	"a125" on 	("a13"."assignment_group_key" = "a125"."row_key")
join	"dw"."d_change_assignment_group_manager"	"a153" on 	("a125"."manager_key" = "a153"."row_key")
UNION 
select 'dw."d_change_assignment_group_level_1" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request" "a13" on ("a11"."change_request_key" = "a13"."row_key")
join	"dw"."d_change_request_assignment_group"	"a125" on 	("a13"."assignment_group_key" = "a125"."row_key")
join	"dw"."d_h_change_assignment_group"	"a126" on 	("a125"."group_hierarchy_key" = "a126"."row_key")
join	"dw"."d_change_assignment_group_level_1"	"a151" on 	("a126"."group_level_1_key" = "a151"."row_key")
UNION 
select 'dw."d_change_assignment_group_level_2" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request" "a13" on ("a11"."change_request_key" = "a13"."row_key")
join	"dw"."d_change_request_assignment_group"	"a125" on 	("a13"."assignment_group_key" = "a125"."row_key")
join	"dw"."d_h_change_assignment_group"	"a126" on 	("a125"."group_hierarchy_key" = "a126"."row_key")
join	"dw"."d_change_assignment_group_level_2"	"a152"  on 	("a126"."group_level_2_key" = "a152"."row_key")
UNION 
select 'dw."d_change_request_close_code" "a12" ' as Table_name, count(1) Row_Count
from dw."f_change_request" "a11" 
join  "dw"."d_change_request" "a13" on ("a11"."change_request_key" = "a13"."row_key")
join	"dw"."d_change_request_close_code"	"a131" on 	("a13"."close_code_src_key" = "a131"."row_key")

