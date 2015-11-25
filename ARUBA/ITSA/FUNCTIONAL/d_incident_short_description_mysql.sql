
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.short_description' ELSE 'SUCCESS' END as Message
 FROM aruba_mdsdb.incident_final SRC 
 LEFT JOIN aruba_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(SRC.short_description,'')<>case when length(TRGT.short_description)>255 then null else TRGT.short_description end