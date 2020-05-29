SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.parent_age_at_task_open' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.problem_task_final WHERE CDCTYPE<>'D') SRC 

LEFT JOIN #DWH_TABLE_SCHEMA.f_problem_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )


LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D') PAR 
 ON (SRC.problem=PAR.sys_id 
 AND SRC.sourceinstance=PAR.sourceinstance )
 
 
 
 WHERE case when PAR.opened_at < SRC.opened_at then TIMESTAMPDIFF(SECOND,PAR.opened_at,SRC.opened_at) else 0 end 
 <> COALESCE(TRGT.parent_age_at_task_open ,'')
 