SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary_aux.shift_key' ELSE 'SUCCESS' END as Message
from 
 cardinalhealth_workdb.fs_skill_call_summary_aux SRC 
LEFT JOIN cardinalhealth_mdwdb.f_skill_call_summary_aux TRGT 
	ON (SRC.row_id =TRGT.row_id and SRC.source_id = TRGT.source_id )
left join cardinalhealth_mdwdb.d_shift LKP
on (LKP.row_id = SRC.shift_id and LKP.source_id =  SRC.source_id )
   where COALESCE((CASE WHEN SRC.shift_id = 'UNSPECIFIED' THEN 0 ELSE LKP.row_key END ), - 1) <> COALESCE(TRGT.shift_key, '')