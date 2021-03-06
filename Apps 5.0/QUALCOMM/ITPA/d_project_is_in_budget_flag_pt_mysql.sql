SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.is_in_budget_flag' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.pm_project_task_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 left join qualcomm_mdwdb.f_project_task F 
 on TRGT.row_key = F.project_key
 WHERE COALESCE( case when (SRC.work_cost - (SRC.cost * F.actual_percent_complete) ) > 0 then 'N' else 'Y' end ,'')
 <> COALESCE(TRGT.is_in_budget_flag ,'')