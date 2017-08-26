SELECT CASE WHEN result = 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN result = 0 THEN 'MDS to DWH data validation failed for f_agent_call_summary_aux' ELSE 'SUCCESS' END as Message
 from 
 (select case when (select count(1) from cardinalhealth_workdb.fs_skill_call_summary_aux ) = 
 (select count(1) from cardinalhealth_mdwdb.f_skill_call_summary_aux) then 1 else 0 end as result) a
	