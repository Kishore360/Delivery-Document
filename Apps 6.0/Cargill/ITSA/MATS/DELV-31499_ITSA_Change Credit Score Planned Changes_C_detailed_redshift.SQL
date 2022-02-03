/* Tables Accessed:
D_CHANGE_REQUEST
N_CHANGE_CREDIT_SCORE_MONTHLY
d_ag_manager_level_1
d_ag_manager_level_2
d_ag_manager_level_3
d_ag_manager_level_4
d_ag_manager_level_5
d_assignment_group_manager
d_calendar_date
d_calendar_month
d_change_calendar_month
d_change_date
d_change_failure_probability
d_change_request_approval
d_change_request_assignment_group
d_change_request_category
d_change_request_risk
d_change_request_state
d_change_request_type
d_h_ag_manager
d_internal_organization_group
f_change_request_planned_start_date */

select 'dw."f_change_request_planned_start_date" "a11" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
UNION 
select 'dw."d_internal_organization_group" "a11" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_internal_organization_group"	"a14"  on ("a11"."ASSIGNMENT_GROUP_KEY" = "a14"."ROW_KEY")
UNION 
select 'dw."d_assignment_group_manager" "a11" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_internal_organization_group"	"a14"  on ("a11"."ASSIGNMENT_GROUP_KEY" = "a14"."ROW_KEY")
join "dw"."d_assignment_group_manager"	"a15" on 	("a14"."assignment_group_manager_key" = "a15"."ROW_KEY")
UNION 
select 'dw."d_h_ag_manager" "a11" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_internal_organization_group"	"a14"  on ("a11"."ASSIGNMENT_GROUP_KEY" = "a14"."ROW_KEY")
join "dw"."d_assignment_group_manager"	"a15" on 	("a14"."assignment_group_manager_key" = "a15"."ROW_KEY")
join "dw"."d_h_ag_manager"	"a16" on 	("a15"."assignment_group_manager_hierarchy_key" = "a16"."ROW_KEY")
UNION 
select 'dw."D_CHANGE_REQUEST" "a11" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST"	"a17" on 	("a11"."CHANGE_REQUEST_KEY" = "a17"."ROW_KEY")
union
select 'dw."d_calendar_date" "a13" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_calendar_date" "a13" on ("a11"."date_key" = "a13"."ROW_KEY")  
union
select 'dw."d_change_date" "a18" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_change_date" "a18" on ("a11"."change_date_key" = "a18"."ROW_KEY")  
union
select 'dw."d_change_request_risk" "a19" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST"	"a17" on 	("a11"."CHANGE_REQUEST_KEY" = "a17"."ROW_KEY")
join "dw"."d_change_request_risk" "a19" on ("a17"."RISK_SRC_KEY" = "a19"."ROW_KEY")  
union
select 'dw."d_change_request_state" "a110" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST"	"a17" on 	("a11"."CHANGE_REQUEST_KEY" = "a17"."ROW_KEY")
join "dw"."d_change_request_state" "a110" on ("a17"."STATE_SRC_KEY" = "a110"."ROW_KEY")  
union
select 'dw."d_calendar_month" "a111" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_calendar_date" "a13" on ("a11"."date_key" = "a13"."ROW_KEY")
join "dw"."d_calendar_month" "a111" on ("a13"."month_start_date_key" = "a111"."ROW_KEY")  
union
select 'dw."d_change_request_category" "a112" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_change_request_category" "a112" on ("a11"."CATEGORY_SRC_KEY" = "a112"."ROW_KEY")  
union
select 'dw."d_change_request_approval" "a113" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST"	"a17" on 	("a11"."CHANGE_REQUEST_KEY" = "a17"."ROW_KEY")
join "dw"."d_change_request_approval" "a113" on ("a17"."APPROVAL_STATE_SRC_KEY" = "a113"."ROW_KEY")  
union
select 'dw."d_change_request_assignment_group" "a114" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST"	"a17" on 	("a11"."CHANGE_REQUEST_KEY" = "a17"."ROW_KEY")
join "dw"."d_change_request_assignment_group" "a114" on ("a17"."ASSIGNMENT_GROUP_KEY" = "a114"."ROW_KEY")  
union
select 'dw."d_change_calendar_month" "a115" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_change_date" "a18" on ("a11"."change_date_key" = "a18"."ROW_KEY") 
join "dw"."d_change_calendar_month" "a115" on ("a18"."month_start_date_key" = "a115"."ROW_KEY")  
union
select 'dw."d_change_request_type" "a116" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST"	"a17" on 	("a11"."CHANGE_REQUEST_KEY" = "a17"."ROW_KEY")
join "dw"."d_change_request_type" "a116" on ("a17"."TYPE_SRC_KEY" = "a116"."ROW_KEY")  
union
select 'dw."d_change_failure_probability" "a117" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."D_CHANGE_REQUEST"	"a17" on 	("a11"."CHANGE_REQUEST_KEY" = "a17"."ROW_KEY")
join "dw"."d_change_failure_probability" "a117" on ("a17"."CHANGE_REQUEST_KEY_FP" = "a117"."CHANGE_REQUEST_KEY")  
union
select 'dw."d_ag_manager_level_1" "a118" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_internal_organization_group"	"a14"  on ("a11"."ASSIGNMENT_GROUP_KEY" = "a14"."ROW_KEY")
join "dw"."d_assignment_group_manager"	"a15" on 	("a14"."assignment_group_manager_key" = "a15"."ROW_KEY")
join "dw"."d_h_ag_manager"	"a16" on 	("a15"."assignment_group_manager_hierarchy_key" = "a16"."ROW_KEY")
join "dw"."d_ag_manager_level_1" "a118" on ("a16"."assignment_group_manager_level_1_key" = "a118"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_2" "a119" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_internal_organization_group"	"a14"  on ("a11"."ASSIGNMENT_GROUP_KEY" = "a14"."ROW_KEY")
join "dw"."d_assignment_group_manager"	"a15" on 	("a14"."assignment_group_manager_key" = "a15"."ROW_KEY")
join "dw"."d_h_ag_manager"	"a16" on 	("a15"."assignment_group_manager_hierarchy_key" = "a16"."ROW_KEY")
join "dw"."d_ag_manager_level_2" "a119" on ("a16"."assignment_group_manager_level_2_key" = "a119"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_3" "a120" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_internal_organization_group"	"a14"  on ("a11"."ASSIGNMENT_GROUP_KEY" = "a14"."ROW_KEY")
join "dw"."d_assignment_group_manager"	"a15" on 	("a14"."assignment_group_manager_key" = "a15"."ROW_KEY")
join "dw"."d_h_ag_manager"	"a16" on 	("a15"."assignment_group_manager_hierarchy_key" = "a16"."ROW_KEY")
join "dw"."d_ag_manager_level_3" "a120" on ("a16"."assignment_group_manager_level_3_key" = "a120"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_4" "a121" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_internal_organization_group"	"a14"  on ("a11"."ASSIGNMENT_GROUP_KEY" = "a14"."ROW_KEY")
join "dw"."d_assignment_group_manager"	"a15" on 	("a14"."assignment_group_manager_key" = "a15"."ROW_KEY")
join "dw"."d_h_ag_manager"	"a16" on 	("a15"."assignment_group_manager_hierarchy_key" = "a16"."ROW_KEY")
join "dw"."d_ag_manager_level_4" "a121" on ("a16"."assignment_group_manager_level_4_key" = "a121"."ROW_KEY")  
union
select 'dw."d_ag_manager_level_5" "a122" ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" "a11" 
join "dw"."d_internal_organization_group"	"a14"  on ("a11"."ASSIGNMENT_GROUP_KEY" = "a14"."ROW_KEY")
join "dw"."d_assignment_group_manager"	"a15" on 	("a14"."assignment_group_manager_key" = "a15"."ROW_KEY")
join "dw"."d_h_ag_manager"	"a16" on 	("a15"."assignment_group_manager_hierarchy_key" = "a16"."ROW_KEY")
join "dw"."d_ag_manager_level_5" "a122" on ("a16"."assignment_group_manager_level_5_key" = "a122"."ROW_KEY") 

