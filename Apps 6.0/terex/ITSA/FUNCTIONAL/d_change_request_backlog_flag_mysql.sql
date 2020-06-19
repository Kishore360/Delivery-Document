SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM terex_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN terex_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  
LEFT JOIN terex_mdwdb.d_lov_map LM
 on concat('STATE~CHANGE_REQUEST~',upper(coalesce(SRC.u_change_state,0)) )= LM.src_rowid
and LM.dimension_class='STATE~CHANGE_REQUEST' 
WHERE coalesce(CASE WHEN LM.dimension_wh_code IN('OPEN') THEN 'Y' ELSE 'N' END,'') <> coalesce(TRGT.backlog_flag,'') 
