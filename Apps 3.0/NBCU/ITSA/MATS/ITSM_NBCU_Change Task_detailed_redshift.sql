


/* Tables Accessed:
d_calendar_date     DONE 
dh_user_group_hierarchy DONE      
d_internal_contact_assigned_to DONE            
dh_user_group_level3   DONE         
dh_user_group_level2   DONE        
dh_user_group_level5           
d_change_task_state_c DONE         
dh_user_group_level1           
d_change_task_c DONE   
f_change_task_c DONE    
dh_user_group_level4 DONE           
d_change_task_priority_c    DONE  
d_internal_organization_group  DONE     */          


SELECT 'ldb.f_change_task_c' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_change_task_c a 
UNION 
SELECT 'ldb.d_change_task_c' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_change_task_c a
JOIN ldb.d_change_task_c b ON a.task_key=b.row_key
UNION 
SELECT 'ldb.d_internal_organization_group' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_change_task_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'ldb.d_change_task_priority_c' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_change_task_c a
JOIN ldb.d_change_task_priority_c b ON a.priority_src_key=b.row_key
UNION 
SELECT 'ldb.d_change_task_state_c' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_change_task_c a
JOIN ldb.d_change_task_state_c b ON a.state_src_key=b.row_key
UNION 
SELECT 'ldb.d_internal_contact_assigned_to' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_change_task_c a
JOIN ldb.d_internal_contact_assigned_to b ON a.assigned_to_key=b.row_key
UNION 
SELECT 'ldb.d_calendar_date' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_change_task_c a
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
UNION 
SELECT 'ldb.dh_user_group_hierarchy' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_change_task_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
UNION 
SELECT 'ldb.dh_user_group_level2' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_change_task_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level2 d ON c.lev_2_key=d.row_key 
UNION 
SELECT 'ldb.dh_user_group_level3' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_change_task_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level3 d ON c.lev_3_key=d.row_key 
UNION 
SELECT 'ldb.dh_user_group_level4' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_change_task_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level4 d ON c.lev_4_key=d.row_key 
UNION 
SELECT 'ldb.dh_user_group_level5' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_change_task_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level5 d ON c.lev_5_key=d.row_key 

