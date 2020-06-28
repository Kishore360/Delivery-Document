

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.u_problem_impact_c' ELSE 'SUCCESS' END as Message 
FROM (
SELECT Count(1) as CNT
FROM (select * from truist_mdsdb.problem_final where cdctype<>'D') a 
LEFT JOIN truist_mdwdb.d_problem b ON a.sys_id=b.row_id and a.sourceinstance=b.source_id
Where a.u_problem_impact<>b.u_problem_impact_c
)temp; 



 