SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM rambus_mdsdb.incident_final SRC 
 LEFT JOIN rambus_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
   JOIN  rambus_mdwdb.f_incident TRGTF 
 ON (TRGTF.incident_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
LEFT JOIN rambus_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key 
WHERE upper(LM.dimension_class)  in( 'STATE~INCIDENT' ,'STATE~ADHOC_REQ' ) and 
( CASE WHEN LM.dimension_wh_code NOT IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END)<> (TRGT.backlog_flag);