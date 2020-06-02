SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (select * from #DWH_TABLE_SCHEMA.f_project_task SRC where cdctype <> 'D' ) SRC
left JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP
on SRC.project_task_state_src_key = LKP.src_key and LKP.source_id = SRC.source_id
where LKP.dimension_wh_code NOT IN ('CLOSED') and SRC.is_active_flag <> CASE WHEN LKP.dimension_wh_code IN ('IN PROGRESS') THEN 'Y' ELSE 'N' END;