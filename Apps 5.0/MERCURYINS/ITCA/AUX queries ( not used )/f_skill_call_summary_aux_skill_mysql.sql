SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary_aux.day_key' ELSE 'SUCCESS' END as Message
from 
 mercuryins_workdb.fs_skill_call_summary_aux SRC 
LEFT JOIN mercuryins_mdwdb.f_skill_call_summary_aux TRGT 
	ON (SRC.row_id =TRGT.row_id and SRC.source_id = TRGT.source_id )
left join mercuryins_mdwdb.d_skill LKP
on LKP.row_id = SRC.skill_id
    where COALESCE((CASE WHEN SRC.skill_id = 'UNSPECIFIED' THEN 0 ELSE LKP.row_key END ), - 1) <> COALESCE(TRGT.skill_key, '')
