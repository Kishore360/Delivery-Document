			
					
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.acw_time' ELSE 'SUCCESS' END as Message
FROM meritsa_mdsdb.dagent_final SRC 
LEFT JOIN meritsa_mdwdb.d_agent TRGT 
	ON (concat(acd,'~',trim(logid)) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE (case when current_flag='Y' 
AND  logid in (49011,49008,49002,49016,49019,49183,49042,49063,49192,49032,49014,49029) 
 then 'Y'  else 'N' end ) <> COALESCE(TRGT.meritsaplus_agent_flag_c,'')