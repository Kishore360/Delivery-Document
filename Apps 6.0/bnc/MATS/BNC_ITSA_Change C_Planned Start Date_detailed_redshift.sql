select 'dw."f_change_request" "a11" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 
 union
select 'dw."d_change_employee" "a12" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 

	join "dw"."d_change_employee" "a12" 
	on ("a11"."change_employee_key" = "a12"."ROW_KEY")  
 union
select 'dw."D_CHANGE_REQUEST" "a13" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 

	join "dw"."D_CHANGE_REQUEST" "a13" 
	on ("a11"."CHANGE_REQUEST_KEY" = "a13"."ROW_KEY")  
 union
select 'dw."d_change_internal_contact_assigned_to" "a14" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 
 join "dw"."D_CHANGE_REQUEST" "a13" 
	on ("a11"."CHANGE_REQUEST_KEY" = "a13"."ROW_KEY") 
	join "dw"."d_change_internal_contact_assigned_to" "a14" 
	on ("a13"."ASSIGNED_TO_KEY" = "a14"."ROW_KEY")  
 union
select 'dw."d_change_request_assignment_group" "a15" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST" "a13" 
	on ("a11"."CHANGE_REQUEST_KEY" = "a13"."ROW_KEY") 
	join "dw"."d_change_request_assignment_group" "a15" 
	on ("a13"."ASSIGNMENT_GROUP_KEY" = "a15"."ROW_KEY")  
 union
select 'dw."d_change_date" "a16" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 

	join "dw"."d_change_date" "a16" 
	on ("a11"."change_date_key" = "a16"."ROW_KEY")  
 union
select 'dw."d_change_calendar_month" "a17" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_change_date" "a16" 
	on ("a11"."change_date_key" = "a16"."ROW_KEY")
	join "dw"."d_change_calendar_month" "a17" 
	on ("a16"."month_start_date_key" = "a17"."ROW_KEY")  
 union
select 'dw."d_change_calendar_quarter" "a18" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_change_date" "a16" on ("a11"."change_date_key" = "a16"."ROW_KEY")
join "dw"."d_change_calendar_month" "a17" 	on ("a16"."month_start_date_key" = "a17"."ROW_KEY")
join "dw"."d_change_calendar_quarter" "a18" on ("a17"."quarter_start_date_key" = "a18"."ROW_KEY")  
 union
select 'dw."d_change_configuration_item" "a19" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST" "a13" 
	on ("a11"."CHANGE_REQUEST_KEY" = "a13"."ROW_KEY") 
	join "dw"."d_change_configuration_item" "a19" 
	on ("a13"."CONFIGURATION_ITEM_KEY" = "a19"."ROW_KEY")  
 union
select 'dw."d_change_calendar_week" "a110" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_change_date" "a16" 
	on ("a11"."change_date_key" = "a16"."ROW_KEY")
	join "dw"."d_change_calendar_week" "a110" 
	on ("a16"."week_start_date_key" = "a110"."ROW_KEY")  
 union
select 'dw."d_change_calendar_year" "a111" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_change_date" "a16" on ("a11"."change_date_key" = "a16"."ROW_KEY")
join "dw"."d_change_calendar_month" "a17" 	on ("a16"."month_start_date_key" = "a17"."ROW_KEY")
join "dw"."d_change_calendar_quarter" "a18" on ("a17"."quarter_start_date_key" = "a18"."ROW_KEY")
join "dw"."d_change_calendar_year" "a111" on ("a18"."year_start_date_key" = "a111"."ROW_KEY")  
 union
select 'dw."d_change_request_risk" "a112" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST" "a13" 
	on ("a11"."CHANGE_REQUEST_KEY" = "a13"."ROW_KEY")
	join "dw"."d_change_request_risk" "a112" 
	on ("a13"."RISK_SRC_KEY" = "a112"."ROW_KEY")  
 union
select 'dw."d_change_request_reported_type" "a113" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 

	join "dw"."d_change_request_reported_type" "a113" 
	on ("a11"."REPORTED_TYPE_SRC_KEY" = "a113"."ROW_KEY")  
 union
select 'dw."d_change_employee_mdm" "a114" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_change_employee" "a12" 
	on ("a11"."change_employee_key" = "a12"."ROW_KEY") 
	join "dw"."d_change_employee_mdm" "a114" 
	on ("a12"."employee_mdm_key" = "a114"."ROW_KEY")  
 union
select 'dw."d_change_request_impact" "a115" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 

	join "dw"."d_change_request_impact" "a115" 
	on ("a11"."IMPACT_SRC_KEY" = "a115"."ROW_KEY")  
 union
select 'dw."d_change_request_priority" "a116" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 

	join "dw"."d_change_request_priority" "a116" 
	on ("a11"."PRIORITY_SRC_KEY" = "a116"."ROW_KEY")  
 union
select 'dw."d_change_request_reason" "a117" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 

	join "dw"."d_change_request_reason" "a117" 
	on ("a11"."reason_src_key" = "a117"."ROW_KEY")  
 union
select 'dw."d_change_request_urgency" "a118" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 

	join "dw"."d_change_request_urgency" "a118" 
	on ("a11"."URGENCY_SRC_KEY" = "a118"."ROW_KEY")  
 union
select 'dw."d_change_request_approval" "a119" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST" "a13" on ("a11"."CHANGE_REQUEST_KEY" = "a13"."ROW_KEY")
join "dw"."d_change_request_approval" "a119" on ("a13"."APPROVAL_STATE_SRC_KEY" = "a119"."ROW_KEY")  
 union
select 'dw."d_change_request_close_code" "a120" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST" "a13" on ("a11"."CHANGE_REQUEST_KEY" = "a13"."ROW_KEY")
join "dw"."d_change_request_close_code" "a120" on ("a13"."CLOSE_CODE_SRC_KEY" = "a120"."ROW_KEY")  
 union
select 'dw."d_change_configuration_item_mdm" "a121" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST" "a13" 
	on ("a11"."CHANGE_REQUEST_KEY" = "a13"."ROW_KEY") 
	join "dw"."d_change_configuration_item" "a19" 
	on ("a13"."CONFIGURATION_ITEM_KEY" = "a19"."ROW_KEY")  
	join "dw"."d_change_configuration_item_mdm" "a121" 
	on ("a19"."mdm_key" = "a121"."ROW_KEY")  
 union
select 'dw."d_change_department" "a122" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 

	join "dw"."d_change_department" "a122" 
	on ("a11"."change_department_key" = "a122"."ROW_KEY")  
 union
select 'dw."d_change_request_state" "a123" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST" "a13" 
	on ("a11"."CHANGE_REQUEST_KEY" = "a13"."ROW_KEY") 
	join "dw"."d_change_request_state" "a123" 
	on ("a13"."STATE_SRC_KEY" = "a123"."ROW_KEY")  
 union
select 'dw."d_change_request_type" "a124" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST" "a13" on ("a11"."CHANGE_REQUEST_KEY" = "a13"."ROW_KEY") 
join "dw"."d_change_request_type" "a124" on ("a13"."TYPE_SRC_KEY" = "a124"."ROW_KEY")  
 union
select 'dw."d_change_assignment_group_manager" "a125" ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST" "a13" 
	on ("a11"."CHANGE_REQUEST_KEY" = "a13"."ROW_KEY") 
	join "dw"."d_change_request_assignment_group" "a15" 
	on ("a13"."ASSIGNMENT_GROUP_KEY" = "a15"."ROW_KEY") 
	join "dw"."d_change_assignment_group_manager" "a125" 
	on ("a15"."manager_key" = "a125"."ROW_KEY") 

UNION 
select 'dw."D_CHANGE_REQUEST_SUBMITTER_C" "a119" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST" "a13" on ("a11"."CHANGE_REQUEST_KEY" = "a13"."ROW_KEY")
join	"dw"."D_CHANGE_REQUEST_SUBMITTER_C"	"a134" on 	("a13"."CHANGE_SUBMITTER_C_KEY" = "a134"."ROW_KEY")
UNION 
select 'dw."D_LOV_CHANGE_REQUEST_ENVIRONMENT_C" "a119" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST" "a13" on ("a11"."CHANGE_REQUEST_KEY" = "a13"."ROW_KEY")
join	"dw"."D_LOV_CHANGE_REQUEST_ENVIRONMENT_C"	"a131" on 	("a13"."CHANGE_ENVIRONMENT_C_KEY" = "a131"."ROW_KEY")
UNION 
select 'dw."D_INTERNAL_CONTACT_CHANGE_ASSIGNED_TO_MANAGER_C" "a119" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST" "a13" on ("a11"."CHANGE_REQUEST_KEY" = "a13"."ROW_KEY")
join	"dw"."D_INTERNAL_CONTACT_CHANGE_ASSIGNED_TO_MANAGER_C"	"a129"  on 	("a13"."CHANGE_ASSIGNED_TO_MANAGER_C_KEY" = "a129"."ROW_KEY")
