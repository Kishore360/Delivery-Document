SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_non_acd_total_fcr_calls' ELSE 'SUCCESS' END as Message
FROM (
select TRGT.TOTAL_FCR_CALLS from
 cardinalhealth_mdsdb.new_call_final SRC
  LEFT JOIN cardinalhealth_mdwdb.f_agent_non_acd TRGT
 ON (TRGT.row_id= SRC.sys_id
	AND SRC.sourceinstance =TRGT.source_id )
WHERE coalesce(CASE WHEN call_type = 'incident' THEN 0 else 1 END,'') <> coalesce(TRGT.TOTAL_FCR_CALLS,'') 
union
SELECT TRGT.TOTAL_FCR_CALLS
FROM cardinalhealth_mdsdb.incident_final SRC 
LEFT JOIN cardinalhealth_mdwdb.f_agent_non_acd TRGT 
ON (SRC.sys_id = TRGT.row_id
AND SRC.sourceinstance =TRGT.source_id )
WHERE
coalesce(CASE WHEN TIMESTAMPDIFF(MINUTE,SRC.opened_at,SRC.resolved_at) <= 30 THEN 1 else 0 END,'') <> coalesce(TRGT.TOTAL_FCR_CALLS,''))TFC