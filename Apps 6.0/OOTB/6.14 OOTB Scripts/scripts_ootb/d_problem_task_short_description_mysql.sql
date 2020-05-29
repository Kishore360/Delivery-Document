 
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.short_description' ELSE 'SUCCESS' END as Message 
 FROM (Select count(1) as cnt
 FROM 
 #MDS_TABLE_SCHEMA.problem_task_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE char_length(SRC.short_description)<=255 and SRC.short_description<>TRGT.short_description)temp;
 