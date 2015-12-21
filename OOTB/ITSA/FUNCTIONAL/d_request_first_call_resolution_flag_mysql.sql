SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.first_call_resolution_flag' ELSE 'SUCCESS' END as Message from (
 select  CASE WHEN  TIMESTAMPDIFF(MINUTE,TRGT.opened_on,TRGT.closed_on)<30
THEN 'Y' ELSE 'N' END abc, COALESCE(TRGT.first_call_resolution_flag ,'') def
 FROM  <<tenant>>_mdwdb.f_request TRGTF 
LEFT JOIN  <<tenant>>_mdwdb.d_request  TRGT
 ON (TRGTF.request_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
left join <<tenant>>_mdsdb.sc_request_final SRC 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )

 LEFT JOIN <<tenant>>_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key
LEFT JOIN <<tenant>>_mdwdb.d_o_data_freshness FRESH  ON(FRESH.source_id=SRC.sourceinstance and FRESH.etl_run_number=TRGTF.etl_run_number) )A
 WHERE abc<>def
