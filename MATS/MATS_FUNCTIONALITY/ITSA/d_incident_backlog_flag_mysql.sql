SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.incident_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  LEFT JOIN  <<tenant>>_mdwdb.f_incident TRGTF 
 ON (TRGTF.incident_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
LEFT JOIN <<tenant>>_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key 
<<<<<<< HEAD
<<<<<<< HEAD
WHERE LM.dimension_class = 'STATE~INCIDENT' and COALESCE( CASE WHEN LM.dimension_wh_code NOT IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END,'')<> COALESCE(TRGT.backlog_flag ,'')
=======
WHERE   LM.dimension_class = 'STATE~INCIDENT' and 
COALESCE( CASE WHEN LM.dimension_wh_code NOT IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END,'')<> COALESCE(TRGT.backlog_flag ,'')
>>>>>>> a5fa536e25b3be231a5fded99554f8880ec7eb5f
=======
WHERE   LM.dimension_class = 'STATE~INCIDENT' and 
COALESCE( CASE WHEN LM.dimension_wh_code NOT IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END,'')<> COALESCE(TRGT.backlog_flag ,'')
>>>>>>> 9467ad812e2581a32a4b254c5353f8b2bad6fb41

