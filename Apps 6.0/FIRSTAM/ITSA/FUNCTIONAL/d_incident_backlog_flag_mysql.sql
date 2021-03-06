SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM firstam_mdsdb.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN firstam_mdwdb.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  LEFT JOIN  firstam_mdwdb.f_incident TRGTF 
 ON (TRGTF.incident_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
LEFT JOIN firstam_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key 
WHERE COALESCE( CASE WHEN LM.dimension_wh_code IN('OPEN') THEN 'Y' ELSE 'N' END ,'')<> COALESCE(TRGT.backlog_flag ,'')

