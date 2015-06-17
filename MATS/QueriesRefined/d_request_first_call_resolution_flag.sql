SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_request_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN  <<tenant>>_mdwdb.f_request  TRGTF 
 ON (TRGTF.request_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)

 LEFT JOIN <<tenant>>_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key
LEFT JOIN <<tenant>>_mdwdb.d_o_data_freshness FRESH  ON(FRESH.source_id=SRC.sourceinstance) 
 WHERE  CASE WHEN  TIMESTAMPDIFF(MINUTE,TRGT.opened_on,TRGT.closed_on)<30
AND  LM.dimension_wh_code IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.first_call_resolution_flag ,'')

