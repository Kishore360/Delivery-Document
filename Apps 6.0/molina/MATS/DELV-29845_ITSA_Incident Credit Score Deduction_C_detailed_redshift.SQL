/* Tables Accessed:
d_ag_manager_level_1
d_ag_manager_level_2
d_ag_manager_level_3
d_ag_manager_level_4
d_ag_manager_level_5
d_assignment_group_manager
d_change_request
d_h_ag_manager
d_incident
d_incident_priority
d_internal_organization_group
f_incident_credit_score_detail */

SELECT 'f_incident_credit_score_detail' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_incident_credit_score_detail" 
UNION 
SELECT 'd_internal_organization_group' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_incident_credit_score_detail" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
UNION 
SELECT 'd_incident' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_incident_credit_score_detail" a  
JOIN "dw"."d_incident" b   ON a.incident_key=b.row_key 
UNION 
SELECT 'd_incident_priority' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_incident_credit_score_detail" a  
JOIN "dw"."d_incident" b   ON a.incident_key=b.row_key  
JOIN "dw"."d_incident_priority" c ON b.priority_src_key=c.row_key 
UNION 
SELECT 'd_assignment_group_manager' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_incident_credit_score_detail" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
JOIN "dw"."d_assignment_group_manager" c ON b.assignment_group_manager_key=c.row_key 
UNION 
SELECT 'd_h_ag_manager' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_incident_credit_score_detail" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
JOIN "dw"."d_assignment_group_manager" c ON b.assignment_group_manager_key=c.row_key 
JOIN "dw"."d_h_ag_manager"  d ON c.assignment_group_manager_hierarchy_key=d.row_key
UNION 
SELECT 'd_ag_manager_level_1' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_incident_credit_score_detail" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
JOIN "dw"."d_assignment_group_manager" c ON b.assignment_group_manager_key=c.row_key 
JOIN "dw"."d_h_ag_manager"  d ON c.assignment_group_manager_hierarchy_key=d.row_key
JOIN "dw"."d_ag_manager_level_1" e ON d.assignment_group_manager_level_1_key=e.row_key 
UNION 
SELECT 'd_ag_manager_level_2' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_incident_credit_score_detail" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
JOIN "dw"."d_assignment_group_manager" c ON b.assignment_group_manager_key=c.row_key 
JOIN "dw"."d_h_ag_manager"  d ON c.assignment_group_manager_hierarchy_key=d.row_key
JOIN "dw"."d_ag_manager_level_2" e ON d.assignment_group_manager_level_2_key=e.row_key 
UNION 
SELECT 'd_ag_manager_level_3' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_incident_credit_score_detail" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
JOIN "dw"."d_assignment_group_manager" c ON b.assignment_group_manager_key=c.row_key 
JOIN "dw"."d_h_ag_manager"  d ON c.assignment_group_manager_hierarchy_key=d.row_key
JOIN "dw"."d_ag_manager_level_3" e ON d.assignment_group_manager_level_3_key=e.row_key
UNION 
SELECT 'd_ag_manager_level_4' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_incident_credit_score_detail" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
JOIN "dw"."d_assignment_group_manager" c ON b.assignment_group_manager_key=c.row_key 
JOIN "dw"."d_h_ag_manager"  d ON c.assignment_group_manager_hierarchy_key=d.row_key
JOIN "dw"."d_ag_manager_level_4" e ON d.assignment_group_manager_level_4_key=e.row_key 
UNION 
SELECT 'd_ag_manager_level_5' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_incident_credit_score_detail" a  
JOIN "dw"."d_internal_organization_group" b   ON a.assignment_group_key=b.row_key
JOIN "dw"."d_assignment_group_manager" c ON b.assignment_group_manager_key=c.row_key 
JOIN "dw"."d_h_ag_manager"  d ON c.assignment_group_manager_hierarchy_key=d.row_key
JOIN "dw"."d_ag_manager_level_5" e ON d.assignment_group_manager_level_5_key=e.row_key 
UNION 
SELECT 'd_change_request' AS Table_Name,Count(1) as Row_COunt 
FROM "dw"."f_incident_credit_score_detail" a  
JOIN "dw"."d_change_request" b   ON a.change_request_key=b.row_key


