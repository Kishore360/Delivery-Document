SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary_aux.day_key' ELSE 'SUCCESS' END as Message
 from mercuryins_workdb.fs_agent_call_summary_aux SRC 
LEFT JOIN mercuryins_mdwdb.f_agent_call_summary_aux TRGT 
	ON (SRC.row_id =TRGT.row_id and SRC.source_id = TRGT.source_id )
left join mercuryins_mdwdb.d_calendar_date  LKP
on (LKP.row_id = SRC.day_id  )										
    where COALESCE( LKP.row_key, - 1) <> COALESCE(TRGT.day_key, '') 