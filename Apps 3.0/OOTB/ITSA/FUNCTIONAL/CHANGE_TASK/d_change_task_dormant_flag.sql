SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.dormant_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_task_final SRC 
  LEFT JOIN <<tenant>>_mdwdb.d_change_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
   JOIN <<tenant>>_mdwdb.d_lov_map dlm ON TRGT.state_src_key = dlm.src_key
    AND dlm.dimension_class = 'STATE~TASK'
  AND dlm.dimension_wh_code = 'OPEN'
  LEFT JOIN (
 select source_id,lastupdated from  <<tenant>>_mdwdb.d_o_data_freshness
 
 ) FRESH  ON(FRESH.source_id=SRC.sourceinstance
 
 )

 WHERE case when (timestampdiff(DAY,TRGT.changed_on, FRESH.lastupdated) >30) and TRGT.dormant_flag = 'N'
   then 'Y' END  <> TRGT.dormant_flag 
