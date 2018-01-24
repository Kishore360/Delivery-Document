


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_hr_task_c.reassignment_count' ELSE 'SUCCESS' END as Message
FROM 
( 
SELECT count(1) AS CNT
FROM molinahealth_mdsdb.u_hr_task_final a 
LEFT JOIN molinahealth_mdwdb.f_hr_task_c b ON (a.sys_id=b.row_id AND a.sourceinstance=b.source_id)
WHERE coalesce(a.reassignment_count,'UNSPECIFIED')<>b.reassignment_count
) a; 







