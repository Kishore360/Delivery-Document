SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task_sla.business_time_left_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM gilead_mdsdb.task_final SRC 
LEFT JOIN gilead_mdsdb.task_sla_final SRC1 ON SRC.sys_id=SRC1.task AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN gilead_mdwdb.f_task_sla TRGT ON SRC1.sys_id=TRGT.row_id AND SRC1.sourceinstance=TRGT.source_id
WHERE 
(
CASE WHEN SRC1.business_time_left is null  THEN NULL   
	 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC1.business_time_left) < 0 THEN NULL    
     WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC1.business_time_left) > 214748364 THEN NULL     
     ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC1.business_time_left) 
     END)<> TRGT.business_time_left_c     
AND TRGT.soft_deleted_flag='N'
) temp;


