


/* Tables Accessed:
d_calendar_date     
dh_user_group_hierarchy      
d_task_priority    DONE    
d_internal_contact_assigned_to  DONE           
dh_user_group_level3           
dh_user_group_level2           
dh_user_group_level5           
dh_user_group_level1           
d_rm_defect_c  DONE      
f_rm_defect_c         
dh_user_group_level4           
d_task_state_c   DONE      
d_internal_organization_group  DONE  */          


SELECT 'ldb.f_rm_defect_c' AS Table_Name,Count (a.row_key) as Row_count
FROM ldb.f_rm_defect_c a 
UNION 
SELECT 'ldb.f_rm_defect_c' AS Table_Name,Count (a.row_key) as Row_count
FROM ldb.f_rm_defect_c a 
JOIN ldb.d_task_state_c b ON a.state_src_key=b.row_key 
UNION 
SELECT 'ldb.d_rm_defect_c' AS Table_Name,Count (a.row_key) as Row_count
FROM ldb.f_rm_defect_c a 
JOIN ldb.d_rm_defect_c b ON a.task_key=b.row_key 
UNION 
SELECT 'ldb.d_internal_organization_group' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_rm_defect_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'ldb.d_internal_contact_assigned_to' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_rm_defect_c a
JOIN ldb.d_internal_contact_assigned_to b ON a.assigned_to_key=b.row_key
UNION 
SELECT 'ldb.d_task_priority' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_rm_defect_c a
JOIN ldb.d_task_priority b ON a.priority_src_key=b.row_key
UNION 
SELECT 'ldb.d_calendar_date' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_rm_defect_c a
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
UNION 
SELECT 'ldb.dh_user_group_hierarchy' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_rm_defect_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
UNION 
SELECT 'ldb.dh_user_group_level2' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_rm_defect_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level2 d ON c.lev_2_key=d.row_key 
UNION 
SELECT 'ldb.dh_user_group_level1' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_rm_defect_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level1 d ON c.lev_1_key=d.row_key 
UNION 
SELECT 'ldb.dh_user_group_level3' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_rm_defect_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level3 d ON c.lev_3_key=d.row_key 
UNION  
SELECT 'ldb.dh_user_group_level4' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_rm_defect_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level4 d ON c.lev_4_key=d.row_key 
UNION 
SELECT 'ldb.dh_user_group_level5' AS Table_Name, Count(a.row_key) as Row_Count 
FROM ldb.f_rm_defect_c a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level5 d ON c.lev_5_key=d.row_key 


