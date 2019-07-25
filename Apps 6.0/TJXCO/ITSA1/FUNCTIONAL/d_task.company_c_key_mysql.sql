SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task.company_c_key' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT 
FROM tjxco_mdsdb.task_sla_final src
join tjxco_mdsdb.task_final a on src.task=a.sys_id and src.sourceinstance=a.sourceinstance
JOIN tjxco_mdwdb.d_task b ON a.sys_id=b.row_id and a.sourceinstance=b.row_id
JOIN tjxco_mdwdb.d_internal_organization LKP ON 
COALESCE(CONCAT('SUBSIDIARY~',a.company),'UNSPECIFIED')=LKP.row_ID and a.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN a.company IS NULL THEN 0 ELSE -1 END)<>b.company_key
)temp;