

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.total_actual_doc_cost' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.pm_project_task_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 left join qualcomm_mdwdb.d_project DIM
 on TRGT.project_key = DIM.row_key
 WHERE CASE WHEN DIM.is_leaf_flag = 'Y' THEN total_actual_doc_cost 
ELSE COALESCE( CAST(coalesce(SRC.work_cost ,0) as decimal(20,10)),'') end<> COALESCE(TRGT.total_actual_doc_cost ,'')
