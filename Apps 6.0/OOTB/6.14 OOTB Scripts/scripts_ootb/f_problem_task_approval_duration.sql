SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.approval_duration' ELSE 'SUCCESS' END as Message

 from  ( SELECT * FROM #MDS_TABLE_SCHEMA.problem_task_final WHERE CDCTYPE<>'D') SRC 
JOIN #DWH_TABLE_SCHEMA.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_problem_task d 
 ON (d.row_id=SRC.sys_id 
 AND d.source_id=SRC.sourceinstance)
WHERE case when coalesce(SRC.approval_set,'') > coalesce(SRC.opened_at,'') and SRC.approval ='APPROVED'  then TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.approval_set) else 0 end 
 <> COALESCE(TRGT.approval_duration ,'')