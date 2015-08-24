SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
 FROM uclahealth_mdsdb.incident_final SRC 
 LEFT JOIN uclahealth_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN uclahealth_mdwdb.f_incident TRGTF
 ON (TRGTF.incident_key =TRGT.row_key  
 AND TRGTF.source_id= TRGT.source_id  )
 
LEFT JOIN uclahealth_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key
LEFT JOIN uclahealth_mdwdb.d_o_data_freshness FRESH  ON(FRESH.source_id=SRC.sourceinstance and FRESH.etl_run_number=TRGTF.etl_run_number) 
 WHERE  CASE WHEN timestampdiff(DAY,TRGT.changed_on,FRESH.lastupdated)>15
AND  LM.dimension_wh_code='OPEN' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.dormant_flag ,'')
