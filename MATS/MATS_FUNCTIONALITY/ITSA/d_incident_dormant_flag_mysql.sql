SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.incident_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.f_incident TRGTF
 ON (TRGTF.incident_key =TRGT.row_key  
 AND TRGTF.source_id= TRGT.source_id  )
 
LEFT JOIN <<tenant>>_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key and  LM.dimension_class = 'STATE~INCIDENT'
AND  LM.dimension_wh_code='OPEN'
LEFT JOIN <<tenant>>_mdwdb.d_o_data_freshness FRESH  ON(FRESH.source_id=SRC.sourceinstance and FRESH.etl_run_number=TRGTF.etl_run_number) 
<<<<<<< HEAD
<<<<<<< HEAD
 WHERE  CASE WHEN timestampdiff(DAY,TRGT.changed_on,FRESH.lastupdated)>30 AND LM.dimension_class = 'STATE~INCIDENT'
=======
 WHERE  CASE WHEN timestampdiff(DAY,TRGT.changed_on,FRESH.lastupdated)>30 and  LM.dimension_class = 'STATE~INCIDENT'
>>>>>>> a5fa536e25b3be231a5fded99554f8880ec7eb5f
=======
 WHERE  CASE WHEN timestampdiff(DAY,TRGT.changed_on,FRESH.lastupdated)>30 and  LM.dimension_class = 'STATE~INCIDENT'
>>>>>>> 9467ad812e2581a32a4b254c5353f8b2bad6fb41
AND  LM.dimension_wh_code='OPEN' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.dormant_flag ,'')
