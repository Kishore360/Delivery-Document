SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM  bhn_mdwdb.d_incident TRGT
   JOIN  bhn_mdwdb.f_incident TRGTF 
 ON (TRGTF.incident_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id  )
 
 JOIN bhn_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key AND LM.dimension_class = 'STATE~INCIDENT'
AND  LM.dimension_wh_code IN('RESOLVED','CLOSED')
WHERE TRGT.soft_deleted_flag='N' and  CASE WHEN  date(opened_on)=date(last_resolved_on)
AND  LM.dimension_wh_code IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END <> (TRGT.first_call_resolution_flag )