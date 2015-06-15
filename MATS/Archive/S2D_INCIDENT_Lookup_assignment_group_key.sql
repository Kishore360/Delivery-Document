

SELECT CASE WHEN COUNT(*) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(*) > 0 THEN 'Lookup for #COL_NAME did not match #REF_TABLE_NAME' ELSE 'SUCCESS' END AS Message

FROM (SELECT CONCAT(BASE.row_id,DCD.row_key) 
FROM d_internal_organization DCD JOIN #BASE_TABLE BASE
ON DCD.row_id = BASE.assignment_group_id AND DCD.group_flag = 'Y'
WHERE CONCAT(BASE.row_id , DCD.row_key) NOT IN (
SELECT CONCAT(row_id , assignment_group_key
)
FROM #TABLE_NAME)) A
