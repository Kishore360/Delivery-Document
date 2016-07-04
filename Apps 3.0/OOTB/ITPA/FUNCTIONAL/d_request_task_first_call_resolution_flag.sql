SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_task_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
  LEFT JOIN  <<tenant>>_mdwdb.f_request_task TRGTF 
 ON (TRGTF.request_task_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)

LEFT JOIN <<tenant>>_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key and LM.dimension_class='STATE~SC_TASK'
LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  <<tenant>>_mdwdb.d_o_data_freshness
 group by source_id
 ) FRESH 
ON (TRGT.source_id = FRESH.source_id)
 WHERE  CASE WHEN  TIMESTAMPDIFF(MINUTE,SRC.opened_at,SRC.closed_at)<30
 
AND  LM.dimension_wh_code IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END  <> COALESCE(TRGT.first_call_resolution_flag ,'')

