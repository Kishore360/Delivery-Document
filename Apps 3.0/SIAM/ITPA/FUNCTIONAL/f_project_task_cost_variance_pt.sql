
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.cost_variance' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.pm_project_task_final SRC 
  LEFT JOIN <<tenant>>_mdwdb.d_lov_map DLM
 ON(DLM.src_rowid=CONCAT('PROJECT~STATE~~',SRC.state))
 LEFT JOIN <<tenant>>_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE CAST(CASE WHEN estimated_doc_cost=0 AND total_actual_doc_cost=0 THEN 0
                   WHEN estimated_doc_cost=0 AND total_actual_doc_cost>0 THEN 1
       ELSE  ROUND( (total_actual_doc_cost- (estimated_doc_cost 1 planned_percent_complete)) /(estimated_doc_cost 1 planned_percent_complete) , 4) END
	   as decimal(28,2) )<>CAST(TRGT.cost_variance as decimal(28,2) )
