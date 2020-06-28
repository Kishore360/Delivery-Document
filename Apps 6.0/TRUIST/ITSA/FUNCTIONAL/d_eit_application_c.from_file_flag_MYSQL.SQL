SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_eit_application_c.from_file_flag' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT FROM
(
SELECT 
a.row_id,a.sourceinstance,
'Y' AS from_file_flag FROM truist_mdsdb.us_technical_health_check_c_final a 
UNION
SELECT 
a.name,a.sourceinstance,
'N' AS from_file_flag FROM truist_mdsdb.cmdb_ci_spkg_final a 
WHERE a.name NOT IN (SELECT b.row_id FROM truist_mdsdb.us_technical_health_check_c_final b)
group by a.name,a.sourceinstance
) as X
LEFT JOIN truist_mdwdb.d_eit_application_c Y ON X.row_id=Y.row_id AND X.sourceinstance=Y.source_id
WHERE X.from_file_flag<>Y.from_file_flag
)temp;

