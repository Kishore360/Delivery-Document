SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_key' ELSE 'SUCCESS' END as Message 
 FROM (
 select case when COALESCE( char_length(replace(SRC.short_description,' ','')),'')>255 then '' else
 COALESCE( char_length(replace(SRC.short_description,' ','')),'') end as short_description_src,TRGT.short_description TRGT_short_description from 
 rei_mdsdb.change_task_final SRC 
 LEFT JOIN rei_mdwdb.d_change_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ))a
 WHERE short_description_src<> COALESCE(char_length(replace(TRGT_short_description,' ','')),'')
 