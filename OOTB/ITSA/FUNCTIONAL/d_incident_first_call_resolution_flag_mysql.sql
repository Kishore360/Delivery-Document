SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM  <<tenant>>_mdwdb.d_incident TRGT
   JOIN  <<tenant>>_mdwdb.f_incident TRGTF 
 ON (TRGTF.incident_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id  and TIMESTAMPDIFF(MINUTE,TRGT.opened_on,TRGT.last_resolved_on)<30)
 
 JOIN <<tenant>>_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key AND LM.dimension_class = 'STATE~INCIDENT'
AND  LM.dimension_wh_code IN('RESOLVED','CLOSED')
 JOIN <<tenant>>_mdwdb.d_o_data_freshness FRESH  ON(FRESH.source_id=TRGTF.source_id
and FRESH.etl_run_number=TRGTF.etl_run_number) 
 WHERE  CASE WHEN  TIMESTAMPDIFF(MINUTE,TRGT.opened_on,TRGT.last_resolved_on)<30
AND  LM.dimension_wh_code IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.first_call_resolution_flag ,'')