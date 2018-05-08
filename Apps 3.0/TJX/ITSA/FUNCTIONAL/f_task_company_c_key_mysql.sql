
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_c.company_c_key' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT 
FROM tjx_mdsdb.task_final a 
JOIN tjx_mdwdb.f_task_c b ON a.sys_id=b.row_id and a.sourceinstance=b.row_id
JOIN tjx_mdwdb.d_internal_organization LKP ON 
COALESCE(CONCAT('SUBSIDIARY~',a.company),'UNSPECIFIED')=LKP.row_ID and a.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN a.company IS NULL THEN 0 ELSE -1 END)<>b.company_c_key
)temp;