SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_hr_task_c.urgency_src_key' ELSE 'SUCCESS' END as Message
FROM 
( 
SELECT count(1) AS CNT
FROM molinahealth_mdsdb.u_hr_task_final a 
 JOIN molinahealth_mdwdb.f_hr_task_c b ON (a.sys_id=b.row_id AND a.sourceinstance=b.source_id)
LEFT JOIN molinahealth_mdwdb.d_lov LKP ON CONCAT('URGENCY~TASK~~~',a.urgency)=LKP.row_id AND a.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN a.urgency IS NULL THEN 0 ELSE -1 END)<>b.urgency_src_key)a
; 



 