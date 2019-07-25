SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task.short_description' ELSE 'SUCCESS' END as  Message
FROM 
(select count(1) as CNT
FROM tjxco_mdsdb.task_sla_final src
left join tjxco_mdsdb.task_final src1 on src.task=src1.sys_id and src.sourceinstance=src1.sourceinstance
left join tjxco_mdwdb.d_task trgt on src1.sys_id=trgt.row_id and src1.sourceinstance=trgt.source_id
WHERE coalesce(src1.short_description,'UNSPECIFIED') <> trgt.short_description and src.cdctype<>'D')temp;