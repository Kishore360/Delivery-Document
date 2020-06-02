	select dp.name,lov_wh1.ci_state1 status,count(d.build_number)
	 from #DWH_TABLE_SCHEMA.f_build_run f
	join #DWH_TABLE_SCHEMA.d_build_run d
	on f.build_run_key=d.row_key
	join #DWH_TABLE_SCHEMA.d_build_project dp
		on f.build_project_key=dp.row_key
	 join  (SELECT lov.*, lov.dimension_code AS ci_state_code1, lov.dimension_name AS ci_state1
				FROM #DWH_TABLE_SCHEMA.d_lov lov
	 -- JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
			   where lov.dimension_class = 'STATE~BUILD'
			UNION 
		SELECT lov.*, lov.dimension_code AS ci_state_code1, lov.dimension_name AS ci_state1
			   FROM #DWH_TABLE_SCHEMA.d_lov lov
			WHERE lov.row_key = -1 OR lov.row_key = 0) lov_wh1
				on d.build_state_src_key = lov_wh1.row_key
		join  (SELECT lov.*, lov.dimension_code AS ci_class_code, lov.dimension_name AS ci_class
			FROM #DWH_TABLE_SCHEMA.d_lov lov
			where lov.dimension_class = 'CLASS~BUILD'
	   union
	   SELECT lov.*, lov.dimension_code AS ci_class_code, lov.dimension_name AS ci_class
	   FROM #DWH_TABLE_SCHEMA.d_lov lov
		   WHERE lov.row_key = -1 OR lov.row_key = 0) lov_wh
				on d.build_class_key = lov_wh.row_key 
				join (
	SELECT lov.*, lov.dimension_code AS ci_project_code, lov.dimension_name AS ci_project
	FROM #DWH_TABLE_SCHEMA.d_lov lov
	where lov.dimension_class = 'BUILDPROJECT~CLASS'
	union
	SELECT lov.*, lov.dimension_code AS ci_project_code, lov.dimension_name AS ci_project
	FROM #DWH_TABLE_SCHEMA.d_lov lov
	WHERE lov.row_key = -1 OR lov.row_key = 0)lov_wh2
	on dp.buildproject_class_key=lov_wh2.row_key
		join #DWH_TABLE_SCHEMA.d_calendar_date dt
			on dt.row_key=f.build_start_on_key
		join #DWH_TABLE_SCHEMA.d_calendar_date dc
			on dc.row_key=dt.month_start_date_key
		where (dc.lagging_count_of_month between 0 and 12  )
	group by dp.name,status
	order by lower(dp.name),lower(lov_wh1.ci_state1); 