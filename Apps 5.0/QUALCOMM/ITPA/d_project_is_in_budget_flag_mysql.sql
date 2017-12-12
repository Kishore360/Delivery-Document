SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.is_in_budget_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.pm_project_final SRC  
 LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 left join #DWH_TABLE_SCHEMA.f_project_task F 
 on TRGT.row_key = F.project_key
 WHERE COALESCE( case when (SRC.work_cost - (SRC.cost * F.actual_percent_complete) ) > 0 then 'N' else 'Y' end ,'')
 <> COALESCE(TRGT.is_in_budget_flag ,'')