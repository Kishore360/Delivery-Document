SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.close_notes' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN   #DWH_TABLE_SCHEMA.d_change_request TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN   #DWH_TABLE_SCHEMA.d_lov_map LM
 on concat('STATE~CHANGE_REQUEST~',upper(SRC.change_request_status) )= LM.src_rowid
and LM.source_id=SRC.sourceinstance
WHERE COALESCE(CASE WHEN LM.dimension_wh_code = 'CLOSED' THEN SRC.status_reason ELSE null END) <> COALESCE(TRGT.close_notes,'')