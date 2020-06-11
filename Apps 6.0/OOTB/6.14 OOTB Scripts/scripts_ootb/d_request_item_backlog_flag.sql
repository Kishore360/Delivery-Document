SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.backlog_flag' ELSE 'SUCCESS' END as Message
 
 
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_req_item_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN  #DWH_TABLE_SCHEMA.d_request_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on concat('STATE~SC_REQ_ITEM~',upper(SRC.state) )= LM.src_rowid
and LM.dimension_class='STATE~SC_REQ_ITEM' 
WHERE CASE WHEN LM.dimension_wh_code NOT IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END <> TRGT.backlog_flag 
