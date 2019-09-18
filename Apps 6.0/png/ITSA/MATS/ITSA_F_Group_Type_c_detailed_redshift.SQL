SELECT 'f_group_type_c' AS Table_Name, Count(1) AS CNT 
FROM ldb.f_group_type_c a 
UNION 
SELECT 'd_internal_organization_group' AS Table_Name, Count(1) AS CNT 
FROM ldb.f_group_type_c a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'd_group_type_c' AS Table_Name, Count(1) AS CNT 
FROM ldb.f_group_type_c a 
JOIN ldb.d_group_type_c b ON a.group_type_c_key=b.row_key


