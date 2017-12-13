SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.parent_project_key' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.pm_project_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 join #DWH_TABLE_SCHEMA.f_project_task F
 on F.project_key = TRGT.row_key
 join
 (
 select FP.sys_id,
 coalesce(concat('0.',reverse(substring(reverse(FP.wbs),locate('.',reverse(FP.wbs))+1,(length(FP.wbs)-locate('.',reverse(FP.wbs))+1)))),'0') parent_wbs,
 FP.top_task
 from #MDS_TABLE_SCHEMA.pm_project_final FP
 order by FP.sys_id, FP.top_task
 ) parent
 on parent.top_task = F.row_id -- and parent.parent_wbs = coalesce(concat('0.',F.wbs),'0')
 WHERE COALESCE(F.project_key, '')<> COALESCE(TRGT.parent_project_key,'')
