SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message

FROM rei_mdsdb.sc_request_final SRC 

 LEFT JOIN rei_mdwdb.d_request TRGT 
 
ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 
LEFT JOIN rei_mdwdb.f_request TRGTF
 
ON (TRGTF.request_key =TRGT.row_key  
 AND TRGTF.source_id= TRGT.source_id  )

 
LEFT JOIN rei_mdwdb.d_lov_map LM 
ON TRGTF.state_src_key=LM.src_key

LEFT JOIN rei_mdwdb.d_o_data_freshness FRESH  
ON(FRESH.source_id=SRC.sourceinstance) 
 AND 

FRESH.lastupdated= (select lastupdated from rei_mdwdb.d_o_data_freshness

where etl_run_number = ( select max(etl_run_number) from rei_mdwdb.d_o_data_freshness)) WHERE 
CASE WHEN timestampdiff(DAY,TRGT.changed_on,FRESH.lastupdated)>14 
AND  LM.dimension_wh_code='OPEN' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.dormant_flag ,'');