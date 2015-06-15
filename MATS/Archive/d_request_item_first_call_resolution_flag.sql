SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.sc_req_item_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_request_item TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 
LEFT JOIN  #DWH_TABLE_SCHEMA.f_request_item TRGTF 
 ON (TRGTF.request_item_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM ON TRGTF.state_src_key=LM.src_key
LEFT JOIN #DWH_TABLE_SCHEMA.d_o_data_freshness FRESH  ON(FRESH.source_id=SRC.sourceinstance) 

 WHERE  CONVERT(CASE WHEN  TIMESTAMPDIFF(MINUTE,TRGT.opened_on,TRGT.closed_on)<30
AND  LM.dimension_wh_code IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END using utf8) <> COALESCE(CONVERT(TRGT.first_call_resolution_flag using utf8),'')
