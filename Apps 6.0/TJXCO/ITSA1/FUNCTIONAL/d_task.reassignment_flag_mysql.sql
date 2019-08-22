SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task.reassignment_flag' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT 
FROM 
tjxco_mdsdb.task_sla_final src1
join tjxco_mdsdb.task_final src on src1.task=src.sys_id and src1.sourceinstance=src.sourceinstance
LEFT JOIN tjxco_mdwdb.d_task trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
WHERE (CASE WHEN src.reassignment_count>0 THEN 'Y' ELSE 'N' END) <> trgt.reassignment_flag and src.cdctype<>'D') temp;