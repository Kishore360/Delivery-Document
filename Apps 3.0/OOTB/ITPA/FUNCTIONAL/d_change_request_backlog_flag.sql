SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  
LEFT JOIN <<tenant>>_mdwdb.d_lov_map LM
 on concat('STATE~CHANGE_REQUEST~~~',upper(SRC.state) )= LM.src_rowid
and LM.dimension_class='STATE~CHANGE_REQUEST' 
WHERE CASE WHEN LM.dimension_wh_code NOT IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END <> TRGT.backlog_flag 
