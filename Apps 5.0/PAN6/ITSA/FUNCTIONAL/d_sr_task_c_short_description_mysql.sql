
 SELECT 
 CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_sr_task_c.short_description' ELSE 'SUCCESS' END as Message 
 FROM 
 (Select count(1) as cnt
 FROM pan6_mdsdb.u_stask_final SRC 
 LEFT JOIN pan6_mdwdb.d_sr_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE Replace(convert(COALESCE(SRC.short_description,'UNSPECIFIED') using ASCII),'?',' ')
 <>TRGT.short_description)temp;