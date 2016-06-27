
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.own_actual_doc_cost' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.pm_project_final SRC 
  LEFT JOIN  (
 select sum(amount) as amount ,task from <<tenant>>_mdsdb.fm_expense_line_final 
 where base_expense is null
 group by task
 ) FEI 
 ON (FEI.task=SRC.sys_id ) 
 
 LEFT JOIN <<tenant>>_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CAST(coalesce(FEI.amount ,0) as decimal(20,10)),'')<> COALESCE(TRGT.own_actual_doc_cost ,'')
