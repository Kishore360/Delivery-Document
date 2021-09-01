Tables Accessed:
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
d_change_request
d_change_request_approval
d_change_request_assignment_group
d_change_request_category
d_change_request_risk
d_change_request_state
d_change_request_type
d_h_ag_manager
d_internal_organization_group
f_change_request_planned_start_date
n_change_credit_score_monthly


select 'dw."f_change_request_planned_start_date" a11 ' as Table_name, count(a11.row_key) Row_Count
from dw."f_change_request_planned_start_date" a11 
UNION 
SELECT 'd_change_request' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_change_request" b   ON a.change_request_key=b.row_key
UNION 
SELECT 'd_calendar_date' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_calendar_date" b   ON a.date_key=b.row_key
UNION 
SELECT 'd_change_date' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_change_date" b   ON a.change_date_key=b.row_key
UNION 
SELECT 'd_calendar_date' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_calendar_date" b   ON a.date_key=b.row_key
JOIN "dw"."d_calendar_month" c ON b.month_start_date_key=c.row_key 
UNION 
SELECT 'd_change_date' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_change_date" b   ON a.change_date_key=b.row_key
JOIN "dw"."d_change_calendar_month" c ON b.month_start_date_key=c.row_key 
UNION 
SELECT 'd_change_request' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_change_request" b   ON a.change_request_key=b.row_key
UNION 
SELECT 'd_change_request' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_change_request" b   ON a.change_request_key=b.row_key
JOIN "dw"."d_change_request_approval" c ON b.approval_state_src_key=c.row_key 
UNION 
SELECT 'd_change_request_assignment_group' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_change_request" b   ON a.change_request_key=b.row_key
JOIN "dw"."d_change_request_assignment_group" c ON b.assignment_group_key=c.row_key 
UNION 
SELECT 'd_change_request_category' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_change_request_category" b ON a.category_src_key=b.row_key 
UNION 
SELECT 'd_change_request_type' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_change_request" b   ON a.change_request_key=b.row_key
JOIN "dw"."d_change_request_type" c ON b.type_src_key=c.row_key 
UNION 
SELECT 'd_change_failure_probability' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_change_request" b   ON a.change_request_key=b.row_key
JOIN "dw"."d_change_failure_probability" c ON b.change_request_key_fp=c.row_key 
UNION 
SELECT 'd_change_request_state' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_change_request" b   ON a.change_request_key=b.row_key
JOIN "dw"."d_change_request_state" c ON b.state_src_key=c.row_key 
UNION 
SELECT 'd_change_request_risk' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_change_request_risk" b ON a.risk_src_key=b.row_key 
UNION 
SELECT 'd_assignment_group_manager' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
JOIN "dw"."d_assignment_group_manager" c ON b.assignment_group_manager_key=c.row_key 
UNION 
SELECT 'd_h_ag_manager' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
JOIN "dw"."d_assignment_group_manager" c ON b.assignment_group_manager_key=c.row_key 
JOIN "dw"."d_h_ag_manager"  d ON c.assignment_group_manager_hierarchy_key=d.row_key
UNION 
SELECT 'd_ag_manager_level_1' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
JOIN "dw"."d_assignment_group_manager" c ON b.assignment_group_manager_key=c.row_key 
JOIN "dw"."d_h_ag_manager"  d ON c.assignment_group_manager_hierarchy_key=d.row_key
JOIN "dw"."d_ag_manager_level_1" e ON d.assignment_group_manager_level_1_key=e.row_key 
UNION 
SELECT 'd_ag_manager_level_2' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
JOIN "dw"."d_assignment_group_manager" c ON b.assignment_group_manager_key=c.row_key 
JOIN "dw"."d_h_ag_manager"  d ON c.assignment_group_manager_hierarchy_key=d.row_key
JOIN "dw"."d_ag_manager_level_2" e ON d.assignment_group_manager_level_2_key=e.row_key 
UNION 
SELECT 'd_ag_manager_level_3' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
JOIN "dw"."d_assignment_group_manager" c ON b.assignment_group_manager_key=c.row_key 
JOIN "dw"."d_h_ag_manager"  d ON c.assignment_group_manager_hierarchy_key=d.row_key
JOIN "dw"."d_ag_manager_level_3" e ON d.assignment_group_manager_level_3_key=e.row_key
UNION 
SELECT 'd_ag_manager_level_4' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
JOIN "dw"."d_assignment_group_manager" c ON b.assignment_group_manager_key=c.row_key 
JOIN "dw"."d_h_ag_manager"  d ON c.assignment_group_manager_hierarchy_key=d.row_key
JOIN "dw"."d_ag_manager_level_4" e ON d.assignment_group_manager_level_4_key=e.row_key 
UNION 
SELECT 'd_ag_manager_level_5' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_change_request_planned_start_date" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
JOIN "dw"."d_assignment_group_manager" c ON b.assignment_group_manager_key=c.row_key 
JOIN "dw"."d_h_ag_manager"  d ON c.assignment_group_manager_hierarchy_key=d.row_key
JOIN "dw"."d_ag_manager_level_5" e ON d.assignment_group_manager_level_5_key=e.row_key 