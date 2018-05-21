 
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.short_description' ELSE 'SUCCESS' END as Message 
 FROM (Select count(1) as cnt
 FROM 
 <<tenant>>_mdsdb.problem_task_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (src.cdctime<=f1.lastupdated) and char_length(SRC.short_description)<=255 and SRC.short_description<>TRGT.short_description)temp;
 