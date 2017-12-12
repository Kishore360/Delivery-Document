SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla_final.business_duration_c' ELSE 'SUCCESS' END as Message 
FROM rambus_mdwdb.f_task_sla trgt
RIGHT JOIN rambus_mdsdb.task_sla_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE trgt.business_duration_c <> CASE WHEN src.business_duration IS NULL  THEN NULL 
							   WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.business_duration) < 0 THEN NULL    
							   WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.business_duration) > 214748364 THEN NULL
							   ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.business_duration) END
							   
							   