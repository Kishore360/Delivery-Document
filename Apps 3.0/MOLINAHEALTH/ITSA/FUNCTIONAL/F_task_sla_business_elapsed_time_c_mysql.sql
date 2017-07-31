
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for F_task_sla.business_elapsed_time_c    ' ELSE 'SUCCESS' END as Message 
FROM molinahealth_mdwdb.f_task_sla trgt
RIGHT JOIN molinahealth_mdsdb.task_sla_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE CASE WHEN src.business_duration IS NULL  THEN NULL  
									  WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.business_duration) < 0 THEN NULL    
									  WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.business_duration) > 214748364 THEN NULL    
									  ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.business_duration) END <> coalesce(business_elapsed_time_c,0)
;
