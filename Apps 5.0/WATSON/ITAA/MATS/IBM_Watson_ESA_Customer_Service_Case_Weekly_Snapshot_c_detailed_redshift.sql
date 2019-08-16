SELECT 'ldb.n_case_weekly_c' as Table_Name,Count(1) as Row_count 
FROM ldb.n_case_weekly_c a 
UNION 
SELECT 'ldb.d_internal_contact_assigned_to' as Table_Name,Count(1) as Row_count 
FROM ldb.n_case_weekly_c a 
JOIN ldb.d_internal_contact_assigned_to b ON a.assigned_to_key=b.row_key
UNION 
SELECT 'ldb.d_internal_organization_group' as Table_Name,Count(1) as Row_count 
FROM ldb.n_case_weekly_c a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'ldb.d_calendar_week' as Table_Name,Count(1) as Row_count 
FROM ldb.n_case_weekly_c a 
JOIN ldb.d_calendar_week b ON a.n_key=b.row_key
UNION 
SELECT 'ldb.d_case_priority' as Table_Name,Count(1) as Row_count 
FROM ldb.n_case_weekly_c a 
JOIN ldb.d_case_priority b ON a.priority_src_key=b.row_key
UNION 
SELECT 'ldb.d_case_state' as Table_Name,Count(1) as Row_count 
FROM ldb.n_case_weekly_c a 
JOIN ldb.d_case_state b ON a.state_src_key=b.row_key
UNION 
SELECT 'ldb.d_tribe_c' as Table_Name,Count(1) as Row_count 
FROM ldb.n_case_weekly_c a 
JOIN ldb.d_tribe_c b ON a.tribe_c_key=b.row_key


