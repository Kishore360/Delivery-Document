SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary_aux.acd_key' ELSE 'SUCCESS' END as Message
 from mercuryins_workdb.fs_agent_call_summary_aux SRC 
LEFT JOIN mercuryins_mdwdb.f_agent_call_summary_aux TRGT 
	ON (SRC.row_id =TRGT.row_id and SRC.source_id = TRGT.source_id )
left join mercuryins_mdwdb.d_acd LKP
on (LKP.row_id = SRC.acd_id and LKP.source_id =  SRC.source_id )										
    where COALESCE((CASE WHEN SRC.acd_id = 'UNSPECIFIED' THEN 0 ELSE LKP.row_key END ), - 1) <> COALESCE(TRGT.acd_key, '')