SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.backlog_flag' ELSE 'SUCCESS' END as Message from (
SELECT ( CASE WHEN LM.dimension_wh_code  IN('OPEN') THEN 'Y' ELSE 'N' END) ABC, (TRGT.backlog_flag )DEF
 FROM <<tenant>>_mdsdb.sc_request_final SRC 
  left JOIN <<tenant>>_mdwdb.d_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
    JOIN  <<tenant>>_mdwdb.f_request TRGTF 
 ON (TRGTF.request_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
  left  JOIN <<tenant>>_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key and LM.dimension_class='REQUEST_STATE~SC_REQUEST')A
WHERE ABC<>DEF