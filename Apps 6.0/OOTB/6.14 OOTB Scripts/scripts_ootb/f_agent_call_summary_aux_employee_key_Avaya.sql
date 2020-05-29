SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary_aux.employee_key' ELSE 'SUCCESS' END as Message
 from app_test.fs_agent_call_summary_aux SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_call_summary_aux TRGT 
	ON (SRC.row_id =TRGT.row_id and SRC.source_id = TRGT.source_id )
left join #DWH_TABLE_SCHEMA.d_internal_contact LKP
on (LKP.row_id = SRC.employee_id and LKP.source_id =  SRC.source_id
AND DATE_FORMAT(SRC.pivot_date, '%Y-%m-%d %H:%i:%s') 
									BETWEEN effective_from AND effective_to )										
    where COALESCE((CASE WHEN SRC.employee_id = 'UNSPECIFIED' THEN 0 ELSE LKP.row_key END ), - 1) <> 
    COALESCE(TRGT.employee_key, '')