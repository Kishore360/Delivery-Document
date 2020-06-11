SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.parent_age_at_task_closure' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.problem_task_final WHERE CDCTYPE<>'D') SRC 

LEFT JOIN #DWH_TABLE_SCHEMA.f_problem_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )


LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D') PAR 
 ON (SRC.problem=PAR.sys_id 
 AND SRC.sourceinstance=PAR.sourceinstance )


 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM 
ON   concat('STATE~PROBLEM_TASK~',upper(SRC.state)) = LM.src_rowid 
AND  LM.dimension_class ='STATE~PROBLEM_TASK'
 
WHERE case when
 LM.dimension_wh_code  IN('CLOSED') and
-- TRGT.closed_on_key<>0 and 
 coalesce(PAR.opened_at,'') < coalesce(SRC.closed_at,'')  then TIMESTAMPDIFF(SECOND,PAR.opened_at,SRC.closed_at) else 0 end 
 <> COALESCE(TRGT.parent_age_at_task_closure ,'')