SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary_aux.day_key' ELSE 'SUCCESS' END as Message
from 
 cardinalhealth_workdb.fs_skill_call_summary_aux SRC 
LEFT JOIN cardinalhealth_mdwdb.f_skill_call_summary_aux TRGT 
	ON (SRC.row_id =TRGT.row_id and SRC.source_id = TRGT.source_id )
left join cardinalhealth_mdwdb.d_calendar_date LKP
on LKP.row_id = SRC.day_id
    where COALESCE(LKP.row_key, '')<> COALESCE(TRGT.day_key, '')
    