SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.short_description' ELSE 'SUCCESS' END as Message
 FROM (
 select case when COALESCE( char_length(replace(SRC.short_description,' ','')),'')>255 then '' else
 COALESCE( char_length(replace(SRC.short_description,' ','')),'') end as short_description_src,TRGT.short_description TRGT_short_description from 
 molinahealth_mdsdb.u_hr_task_final SRC 
 LEFT JOIN molinahealth_mdwdb.d_hr_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ))a
 WHERE short_description_src<> COALESCE(char_length(replace(TRGT_short_description,' ','')),'')
 
 