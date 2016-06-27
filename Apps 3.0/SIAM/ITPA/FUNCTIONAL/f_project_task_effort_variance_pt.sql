

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.effort_variance' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.pm_project_task_final SRC 
  LEFT JOIN <<tenant>>_mdwdb.d_lov_map DLM
 ON(DLM.src_rowid=CONCAT('PROJECT~STATE~~',SRC.state))
 LEFT JOIN <<tenant>>_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE CAST(case when effort= null then 1 
 else (
  case when DLM.dimension_wh_code=  'CLOSED' then timestampdiff(hour,effort,work_effort)/timestampdiff(hour,'1970-01-01 00:00:00',effort) 
    else
   (( timestampdiff(hour,'1970-01-01 00:00:00',work_effort) -  (timestampdiff(hour,'1970-01-01 00:00:00',effort) 1 planned_percent_complete))
   /(timestampdiff(hour,'1970-01-01 00:00:00',effort) 1 planned_percent_complete)
   )  
  end  
  ) 
end as decimal(28,2) )<>CAST(TRGT.effort_variance as decimal(28,2) )
