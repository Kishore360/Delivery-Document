SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_non_acd_total_agent_calls' ELSE 'SUCCESS' END as Message
FROM (
select TRGT.TOTAL_AGENT_CALLS from 
 cardinalhealth_mdsdb.new_call_final SRC
  LEFT JOIN cardinalhealth_mdwdb.f_agent_non_acd TRGT
 ON (TRGT.row_id= SRC.sys_id
	AND SRC.sourceinstance =TRGT.source_id )
WHERE 1 <> coalesce(TRGT.TOTAL_AGENT_CALLS,'')
union
SELECT TRGT.TOTAL_AGENT_CALLS
FROM cardinalhealth_mdsdb.incident_final SRC 
LEFT JOIN cardinalhealth_mdwdb.f_agent_non_acd TRGT 
ON (SRC.sys_id = TRGT.row_id
AND SRC.sourceinstance =TRGT.source_id )
WHERE
0 <> coalesce(TRGT.TOTAL_AGENT_CALLS,''))TAC