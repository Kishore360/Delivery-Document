SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (
 select case when COALESCE( char_length(replace(SRC.short_description,' ','')),'')>255 then '' else
 COALESCE( char_length(replace(SRC.short_description,' ','')),'') end as short_description_src,TRGT.short_description TRGT_short_description,lkp.name from 
 bbandt_mdsdb.incident_final SRC 
left join bbandt_mdsdb.sys_user_group_final lkp 
on SRC.assignment_group = lkp.sys_id 
and SRC.sourceinstance = lkp.sourceinstance
 LEFT JOIN bbandt_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ))a
 WHERE short_description_src<> COALESCE(char_length(replace(TRGT_short_description,' ','')),'') -- 46303
and ((name not like 'ITSM-LOB-Branchinfo%' and name not like 'ITSM-LOB-HumanSystems%' and name not like 'ITSM-LOB-CPS%'
and name not like 'ITSM-LOB-LoanServices%' and name not like 'ITSM-LOB-Wealth%') or name is null);
