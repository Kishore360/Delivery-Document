SELECT CASE WHEN count(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.short_description' ELSE 'SUCCESS' END as Message 
FROM   nypres_mdwdb.d_task TRGT
JOIN nypres_mdsdb.task_final SRC 
ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  
where SRC.short_description <> TRGT.short_description