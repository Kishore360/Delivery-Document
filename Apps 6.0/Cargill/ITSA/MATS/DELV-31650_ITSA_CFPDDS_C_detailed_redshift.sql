/* Tables Accessed:
d_ag_manager_level_1
d_ag_manager_level_2
d_ag_manager_level_3
d_ag_manager_level_4
d_ag_manager_level_5
d_assignment_group_manager
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_year
d_cfp_model_risk_factors
d_change_application
d_change_application_mdm
d_change_business_service
d_change_department
d_change_failure
d_change_failure_probability
d_change_internal_contact_assigned_to
d_change_request
d_change_request_approval
d_change_request_assignment_group
d_change_request_close_code
d_change_request_state
d_change_request_type
d_ci_location
d_configuration_item
d_configuration_item_mdm
d_h_ag_manager
d_internal_contact_change_closed_by
d_internal_organization_group
f_caused_by_change
f_change_failure_closed
f_change_failure_implemented
f_change_failure_opened
f_change_failure_planned
f_incident
f_problem */

select 'dw."f_change_failure_closed" "a11" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" "a11" 
 union
select 'dw."d_internal_organization_group" "a12" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."assignment_group_key" = "a12"."row_key")  
union
select 'dw."d_configuration_item" "a13" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_configuration_item" "a13" on ("a11"."ci_key" = "a13"."row_key")  
 union
select 'dw."d_calendar_date" "a14" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_calendar_date" "a14" on ("a11"."date_key" = "a14"."row_key")  
union
select 'dw."d_change_request" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_change_request" "a15" on ("a11"."change_request_key" = "a15"."row_key")  
union
select 'dw."d_change_request_state" "a16" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_change_request_state" "a16" on ("a11"."change_state_src_key" = "a16"."row_key")  
union
select 'dw."d_calendar_month" "a17" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_calendar_month" "a17" on ("a14"."month_start_date_key" = "a17"."row_key") 
UNION 
select 'dw."d_internal_contact_change_closed_by" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_change_request" "a15" on ("a11"."change_request_key" = "a15"."row_key") 
join	"dw"."d_internal_contact_change_closed_by"	"a15" on 	("a15"."closed_by_key" = "a152"."row_key")
UNION 
select 'dw."d_change_department" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_change_request" "a15" on ("a11"."change_request_key" = "a15"."row_key") 
join	"dw"."d_change_department"	"a153" on 	("a15"."requested_by_department_key" = "a153"."row_key")
UNION 
select 'dw."d_change_request_type" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_change_request" "a15" on ("a11"."change_request_key" = "a15"."row_key") 
join	"dw"."d_change_request_type"	"a153" on 	("a15"."type_src_key" = "a153"."row_key")
UNION
select 'dw."d_change_failure_probability" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_change_request" "a15" on ("a11"."change_request_key" = "a15"."row_key") 
join	"dw"."d_change_failure_probability"	"a157" on 	("a15"."change_request_key_fp" = "a157"."change_request_key")
UNION 
select 'dw."d_configuration_item_mdm" "a13" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_configuration_item" "a13" on ("a11"."ci_key" = "a13"."row_key")
join "dw"."d_configuration_item_mdm" "a14" on ("a13"."mdm_key" = "a14"."row_key")
UNION 
select 'dw."d_assignment_group_manager" "a12" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."assignment_group_key" = "a12"."row_key") 
join	"dw"."d_assignment_group_manager"	"a13" on 	("a12"."assignment_group_manager_key" = "a13"."row_key")
UNION 
select 'dw."d_h_ag_manager" "a12" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_internal_organization_group" "a12" on ("a11"."assignment_group_key" = "a12"."row_key") 
join	"dw"."d_assignment_group_manager"	"a13" on ("a12"."assignment_group_manager_key" = "a13"."row_key")
join	"dw"."d_h_ag_manager"	"a14" on 	("a13"."assignment_group_manager_hierarchy_key" = "a14"."row_key")
UNION 
select 'dw."d_configuration_item_mdm" "a13" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_configuration_item" "a13" on ("a11"."ci_key" = "a13"."row_key")
join "dw"."d_configuration_item_mdm" "a14" on ("a13"."mdm_key" = "a14"."row_key")
join "dw"."d_ci_location"	"a156" on 	("a14"."location_key" = "a156"."row_key")
UNION 
select 'dw."d_change_request_close_code" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_change_request" "a15" on ("a11"."change_request_key" = "a15"."row_key") 
join	"dw"."d_change_request_close_code"	"a151" on 	("a15"."close_code_src_key" = "a151"."row_key")
UNION 
select 'dw."d_change_failure" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_change_failure" "a15" on ("a11"."change_failure_key" = "a15"."row_key") 
UNION 
select 'dw."d_cfp_model_risk_factors" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_change_failure" "a15" on ("a11"."change_failure_key" = "a15"."row_key") 
join	"dw"."d_cfp_model_risk_factors"	"a137" on 	("a15"."model_risk_factor_change_request_key" = "a137"."row_key")
UNION 
select 'dw."d_change_application" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_change_request" "a15" on ("a11"."change_request_key" = "a15"."row_key") 
join	"dw"."d_change_application"	"a134" on 	("a15"."application_key" = "a134"."row_key")
UNION 
select 'dw."d_change_application_mdm" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_change_request" "a15" on ("a11"."change_request_key" = "a15"."row_key") 
join	"dw"."d_change_application"	"a134" on 	("a15"."application_key" = "a134"."row_key")
join	"dw"."d_change_application_mdm"	"a146" on 	("a134"."mdm_key" = "a146"."row_key")
UNION 
select 'dw."d_change_business_service" "a15" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_failure_closed" "a11" 
join "dw"."d_change_request" "a15" on ("a11"."change_request_key" = "a15"."row_key") 
join	"dw"."d_change_business_service"	"a150" on 	("a15"."business_service_key" = "a150"."row_key")
