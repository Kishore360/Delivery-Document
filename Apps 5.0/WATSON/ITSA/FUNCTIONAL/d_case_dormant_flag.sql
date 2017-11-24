SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.dormant_flag' ELSE 'SUCCESS' END as Message
 FROM watson_mdsdb.sn_customerservice_case_final SRC 
 LEFT JOIN watson_mdwdb.d_case TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN watson_mdwdb.f_case TRGTF
 ON (TRGTF.case_key  =TRGT.row_key  
 AND TRGTF.source_id = TRGT.source_id  )
 
LEFT JOIN watson_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key and LM.dimension_class = 'STATE~CASE'
  AND LM.dimension_wh_code not in ('RESOLVED','CLOSED')
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  watson_mdwdb.d_o_data_freshness
 group by source_id
 )   FRESH 
 ON(FRESH.source_id=SRC.sourceinstance) 
 WHERE  TRGT.row_key not in (0, -1) and 
 CASE WHEN timestampdiff(DAY,TRGT.changed_on,FRESH.lastupdated)>30
AND  LM.dimension_wh_code='OPEN' THEN 'Y' ELSE 'N' END  <> COALESCE(TRGT.dormant_flag ,'')