SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (select * from #DWH_TABLE_SCHEMA.f_project_task SRC  WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.d_lov LKP
on LKP.dimension_class =  'WH_PROJECT~WEEK_BUCKET~TO_DUE_DATE'   and COALESCE( SRC.weeks_to_due_date, 0) >= LKP.lower_range_value AND COALESCE( SRC.weeks_to_due_date, 0) < LKP.upper_range_value
left join #DWH_TABLE_SCHEMA.d_lov_map MAP
on MAP.src_key = SRC.project_task_state_src_key AND MAP.source_id=SRC.source_id
where MAP.dimension_wh_code NOT IN ('CLOSED') and SRC.weeks_to_due_date_bucket_key <> COALESCE(LKP.row_key, -1)