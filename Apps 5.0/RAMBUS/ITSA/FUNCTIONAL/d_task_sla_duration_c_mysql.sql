SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla_final.duration_c' ELSE 'SUCCESS' END as Message 
FROM  rambus_mdwdb.d_task_sla trgt
RIGHT JOIN rambus_mdsdb.contract_sla_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE trgt.sla_duration = CASE WHEN src.duration IS NULL  THEN NULL 
							   WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.duration) < 0 THEN NULL    
							   WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.duration) > 214748364 THEN NULL
							   ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.duration) END
							   
							   
							   