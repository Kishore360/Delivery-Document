select'ldb.f_t_task_activity_reassignment_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
union
select'ldb.d_task_ra_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_task_ra_c         a12
on (a11.task_row_key=a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_calendar_date         a13
on (a11.assigned_on_key=a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_internal_organization_group         a14
on (a11.current_assginment_group_key=a14.row_key)
union
select'ldb.d_task_ra_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_task_ra_state_c         a15
on (a11.state_src_key=a15.row_key)
union
select'ldb.d_internal_contact_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_internal_contact_to         a16
on (a11.to_assigned_to_key=a16.row_key)
union
select'ldb.d_internal_organization_group_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_internal_organization_group_to         a17
on (a11.to_assignment_group_key=a17.row_key)
union
select'ldb.d_internal_contact_from' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_internal_contact_from         a18
on (a11.from_assigned_to_key=a18.row_key)
union
select'ldb.d_internal_organization_group_from' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_internal_organization_group_from         a19
on (a11.from_assignment_group_key=a19.row_key)
union
select'ldb.d_calendar_date_opened' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_calendar_date_opened         a110
on (a11.opened_on_key=a110.row_key)
union
select'ldb.d_task_ra_priority_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
join ldb.d_task_ra_priority_c         a111
on (a11.priority_src_key=a111.row_key)
union
select'ldb.d_task_parent_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_t_task_activity_reassignment_c             a11 
 join ldb.d_task_ra_c         a12
on (a11.task_row_key=a12.row_key)
join ldb.d_task_parent_c         a112
on (a12.parent_task_key=a112.row_key)
UNION 
SELECT 'f_t_task_activity_reassignment_c' as Table_Name,Count(a.row_key) as Row_count
FROM ldb.f_t_task_activity_reassignment_c a
UNION 
SELECT 'dh_user_group_hierarchy' as Table_Name,Count(a.row_key) as Row_count
FROM ldb.f_t_task_activity_reassignment_c a
JOIN ldb.d_internal_organization_group b ON a.current_assginment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
UNION 
SELECT 'dh_user_group_level1' as Table_Name,Count(a.row_key) as Row_count
FROM ldb.f_t_task_activity_reassignment_c a
JOIN ldb.d_internal_organization_group b ON a.current_assginment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level1 d ON c.lev_1_key=d.row_key
UNION 
SELECT 'dh_user_group_level2' as Table_Name,Count(a.row_key) as Row_count
FROM ldb.f_t_task_activity_reassignment_c a
JOIN ldb.d_internal_organization_group b ON a.current_assginment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level2 d ON c.lev_2_key=d.row_key
UNION 
SELECT 'dh_user_group_level3' as Table_Name,Count(a.row_key) as Row_count
FROM ldb.f_t_task_activity_reassignment_c a
JOIN ldb.d_internal_organization_group b ON a.current_assginment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level3 d ON c.lev_3_key=d.row_key
UNION
SELECT 'dh_user_group_level4' as Table_Name,Count(a.row_key) as Row_count
FROM ldb.f_t_task_activity_reassignment_c a
JOIN ldb.d_internal_organization_group b ON a.current_assginment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level4 d ON c.lev_4_key=d.row_key
UNION 
SELECT 'dh_user_group_level5' as Table_Name,Count(a.row_key) as Row_count
FROM ldb.f_t_task_activity_reassignment_c a
JOIN ldb.d_internal_organization_group b ON a.current_assginment_group_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level5 d ON c.lev_5_key=d.row_key
UNION 
select 'ldb.dh_user_group_hierarchy_new_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_internal_organization_group_to a17 on (a11.to_assignment_group_key=a17.row_key)
join ldb.dh_user_group_hierarchy_new_c a18 ON (a17.row_dn_key=a18.lev_0_key)
UNION 
select 'ldb.dh_user_group_level1_new_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_internal_organization_group_to a17 on (a11.to_assignment_group_key=a17.row_key)
join ldb.dh_user_group_hierarchy_new_c a18 ON (a17.row_dn_key=a18.lev_0_key)
join ldb.dh_user_group_level1_new_c a19 ON (a18.lev_1_key=a19.row_key)
UNION 
select 'ldb.dh_user_group_level2_new_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_internal_organization_group_to a17 on (a11.to_assignment_group_key=a17.row_key)
join ldb.dh_user_group_hierarchy_new_c a18 ON (a17.row_dn_key=a18.lev_0_key)
join ldb.dh_user_group_level2_new_c a19 ON (a18.lev_2_key=a19.row_key)
UNION 
select 'ldb.dh_user_group_level3_new_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_internal_organization_group_to a17 on (a11.to_assignment_group_key=a17.row_key)
join ldb.dh_user_group_hierarchy_new_c a18 ON (a17.row_dn_key=a18.lev_0_key)
join ldb.dh_user_group_level3_new_c a19 ON (a18.lev_3_key=a19.row_key)
UNION 
select 'ldb.dh_user_group_level4_new_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_internal_organization_group_to a17 on (a11.to_assignment_group_key=a17.row_key)
join ldb.dh_user_group_hierarchy_new_c a18 ON (a17.row_dn_key=a18.lev_0_key)
join ldb.dh_user_group_level4_new_c a19 ON (a18.lev_4_key=a19.row_key)
UNION 
select 'ldb.dh_user_group_level5_new_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_t_task_activity_reassignment_c a11 
join ldb.d_internal_organization_group_to a17 on (a11.to_assignment_group_key=a17.row_key)
join ldb.dh_user_group_hierarchy_new_c a18 ON (a17.row_dn_key=a18.lev_0_key)
join ldb.dh_user_group_level5_new_c a19 ON (a18.lev_5_key=a19.row_key)


