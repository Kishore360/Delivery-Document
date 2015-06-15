SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.dormant_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.sc_request_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_request TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request TRGTF
 ON (convert(TRGTF.request_key using utf8) =convert(TRGT.row_key using utf8) 
 AND convert(TRGTF.source_id using utf8)= convert(TRGT.source_id using utf8) )
 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM ON TRGTF.state_src_key=LM.src_key
LEFT JOIN #DWH_TABLE_SCHEMA.d_o_data_freshness FRESH  ON(FRESH.source_id=SRC.sourceinstance) 
 WHERE  CONVERT(CASE WHEN timestampdiff(DAY,TRGT.changed_on,FRESH.lastupdated)>30
AND  LM.dimension_wh_code='OPEN' THEN 'Y' ELSE 'N' END using utf8) <> COALESCE(CONVERT(TRGT.dormant_flag using utf8),'')
