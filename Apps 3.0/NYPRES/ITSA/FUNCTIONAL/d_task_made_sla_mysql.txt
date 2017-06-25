SELECT CASE WHEN count(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.category_c_key' ELSE 'SUCCESS' END as Message 
FROM   nypres_mdwdb.d_task TRGT
JOIN nypres_mdsdb.task_final SRC 
ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  
where (CASE WHEN SRC.made_sla = 1 then 'Y' else 'N' END) <> TRGT.met_sla_flag