SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_project.aop_flag_c' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT
From terex_mdsdb.pv_projects_final SRC
LEFT JOIN terex_mdwdb.d_project TRGT ON (SRC.id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE CASE WHEN SRC.AOP = 'Yes' THEN 'Y' ELSE 'N' END <>TRGT.aop_flag_c
AND cdctype='X'
) temp; 


