SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary_aux.acd_key' ELSE 'SUCCESS' END as Message
from 
 app_test.fs_skill_call_summary_aux SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_skill_call_summary_aux TRGT 
	ON (SRC.row_id =TRGT.row_id and SRC.source_id = TRGT.source_id )
left join #DWH_TABLE_SCHEMA.d_acd LKP
on LKP.row_id = SRC.acd_id
    where COALESCE((CASE WHEN SRC.acd_id = 'UNSPECIFIED' THEN 0 ELSE LKP.row_key END ), - 1) <> COALESCE(TRGT.acd_key, '')
    
  