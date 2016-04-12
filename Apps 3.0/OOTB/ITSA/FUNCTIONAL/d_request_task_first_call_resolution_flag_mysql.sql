SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request_task.first_call_resolution_flag' ELSE 'SUCCESS' END as Message from(

select count(1) cnt
 FROM <<tenant>>_mdsdb.sc_task_final SRC  LEFT JOIN <<tenant>>_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 
 
  LEFT JOIN  <<tenant>>_mdwdb.f_request_task TRGTF 
 ON (TRGTF.request_task_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)

where CASE WHEN  TIMESTAMPDIFF(MINUTE,SRC.opened_at,coalesce(SRC.closed_at,SRC.sys_updated_on))<30  THEN 'Y' ELSE 'N' END<>(TRGT.first_call_resolution_flag)
)a 

