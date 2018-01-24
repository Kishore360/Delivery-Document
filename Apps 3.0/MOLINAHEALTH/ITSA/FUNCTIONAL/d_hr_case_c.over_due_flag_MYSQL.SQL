SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_hr_case_c.over_due_flag' ELSE 'SUCCESS' END as Message
FROM 
( 
SELECT Count(1) AS CNT
FROM molinahealth_mdsdb.u_hr_case_final a 
LEFT JOIN molinahealth_mdwdb.d_hr_case_c b ON (a.sys_id=b.row_id AND a.sourceinstance=b.source_id)
WHERE COALESCE(CASE WHEN(active =1 AND a.due_date < current_time ) THEN 'Y' ELSE 'N' END, 'UNSPECIFIED')<>b.over_due_flag
) a; 







