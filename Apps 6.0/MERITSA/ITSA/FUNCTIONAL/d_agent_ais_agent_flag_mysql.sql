SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.acw_time' ELSE 'SUCCESS' END as Message
FROM mercuryins_mdsdb.dagent_final SRC 
LEFT JOIN mercuryins_mdwdb.d_agent TRGT 
	ON (concat(acd,'~',trim(logid)) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE (CASE
            WHEN d_agent.identification_number like '79%' AND length(d_agent.identification_number) = 5 THEN 'Y'
            ELSE 'N' end ) <> COALESCE(TRGT.ais_agent_flag_c,'')