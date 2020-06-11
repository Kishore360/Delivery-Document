SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary_aux.aux_code_src_key' ELSE 'SUCCESS' END as Message
from 
 app_test.fs_skill_call_summary_aux SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_skill_call_summary_aux TRGT 
	ON (SRC.row_id =TRGT.row_id and TRGT.source_id = SRC.source_id)
left join #DWH_TABLE_SCHEMA.d_lov LKP
on (LKP.row_id = SRC.aux_code_src_id and LKP.source_id =  SRC.source_id 
AND DATE_FORMAT(SRC.pivot_date, '%Y-%m-%d %H:%i:%s') 
									BETWEEN LKP.effective_from AND LKP.effective_to )
    where COALESCE((CASE WHEN SRC.aux_code_src_id = 'UNSPECIFIED' THEN 0 ELSE LKP.row_key END ), - 1) <> COALESCE(TRGT.aux_code_src_key, '')