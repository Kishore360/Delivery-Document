SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.age_of_parent_at_task_closure' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.d_problem_task SRC 

JOIN #DWH_TABLE_SCHEMA.f_task TRGT 
 ON (SRC.row_id=TRGT.row_id 
 AND SRC.source_id=TRGT.source_id )
and TRGT.soft_deleted_flag<>'Y'
JOIN #DWH_TABLE_SCHEMA.d_problem PAR 
 ON (SRC.problem_key=PAR.row_key 
 AND SRC.source_id=PAR.source_id )


 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM 
ON   SRC.state_src_key = LM.src_key 
AND  LM.dimension_class ='STATE~PROBLEM_TASK'
 
 
 
WHERE case when
 LM.dimension_wh_code  IN('CLOSED') and
-- TRGT.closed_on_key<>0 and 
 coalesce(PAR.opened_on,'') < coalesce(SRC.closed_on,'')  then TIMESTAMPDIFF(SECOND,PAR.opened_on,SRC.closed_on) else 0 end 
 <> COALESCE(TRGT.age_of_parent_at_task_closure ,'')