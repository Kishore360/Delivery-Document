SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM  mercuryins_mdwdb.d_incident TRGT
   JOIN  mercuryins_mdwdb.f_incident TRGTF 
 ON (TRGTF.incident_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id  and TIMESTAMPDIFF(MINUTE,TRGT.opened_on,TRGT.last_resolved_on)<30)
 
 JOIN mercuryins_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key AND LM.dimension_class = 'STATE~INCIDENT'
AND  LM.dimension_wh_code IN('RESOLVED','CLOSED')
WHERE  CASE WHEN  TIMESTAMPDIFF(MINUTE,TRGT.opened_on,TRGT.last_resolved_on)<30
AND  LM.dimension_wh_code IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END <> (TRGT.first_call_resolution_flag )