SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.acw_time' ELSE 'SUCCESS' END as Message
FROM mercury_mdsdb.dagent_final SRC 
LEFT JOIN mercury_mdwdb.d_agent TRGT 
	ON (concat(acd,'~',trim(logid)) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE (CASE
            WHEN TRGT.identification_number like '79%' AND length(TRGT.identification_number) = 5 THEN 'Y'
            ELSE 'N' end ) <> COALESCE(TRGT.ais_agent_flag_c,'')