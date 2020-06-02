SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task.age_of_parent_at_task_closure' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.d_task SRC 

JOIN #DWH_TABLE_SCHEMA.d_task PAR 
 ON (SRC.parent_task_key=PAR.row_key 
 AND SRC.source_id=PAR.source_id )
and PAR.parent_task_flag='Y'
JOIN #DWH_TABLE_SCHEMA.f_task TRGT 
 ON (SRC.row_id=TRGT.row_id 
 AND SRC.source_id=TRGT.source_id )
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM 
ON   SRC.state_src_key = LM.src_key 
AND  LM.dimension_class in ('STATE~SC_TASK','STATE~INCIDENT',
                                      'STATE~CHANGE_REQUEST','STATE~PROBLEM',
                                      'STATE~PROBLEM_TASK','STATE~SC_REQ_ITEM',
                                      'REQUEST_STATE~SC_REQUEST','STATE~CHANGE_TASK')
 
 
 
WHERE case when
 LM.dimension_wh_code  IN('CLOSED') and
-- TRGT.closed_on_key<>0 and 
 coalesce(PAR.opened_on,'') < coalesce(SRC.closed_on,'')  then TIMESTAMPDIFF(SECOND,PAR.opened_on,SRC.closed_on) else 0 end 
 <> COALESCE(TRGT.age_of_parent_at_task_closure ,'')