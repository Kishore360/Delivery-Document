SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM   weillcornell_mdsdb.incident_final SRC
JOIN weillcornell_mdwdb.d_incident TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
    JOIN  weillcornell_mdwdb.f_incident TRGTF 
 ON (TRGTF.incident_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id  )
 
 JOIN weillcornell_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key AND LM.dimension_class = 'STATE~INCIDENT'
AND  LM.dimension_wh_code IN('RESOLVED','CLOSED')
WHERE  case when date_format(TRGT.opened_on,'%Y%m%d')=date_format(coalesce(TRGT.last_resolved_on,TRGT.closed_on),'%Y%m%d')
 and SRC.reassignment_count=0 AND  LM.dimension_wh_code IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END <> (TRGT.first_call_resolution_flag );