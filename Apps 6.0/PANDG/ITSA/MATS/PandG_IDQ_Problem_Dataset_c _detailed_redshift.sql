SELECT 'f_problem' AS Table_Name, Count(1) as CNT 
FROM ldb.f_problem a
UNION 
SELECT 'd_configuration_item' AS Table_Name, Count(1) as CNT 
FROM ldb.f_problem a
JOIN ldb.d_configuration_item b ON a.configuration_item_key=b.row_key
UNION 
SELECT 'd_problem' AS Table_Name, Count(1) as CNT 
FROM ldb.f_problem a
JOIN ldb.d_problem b ON a.problem_key=b.row_key



