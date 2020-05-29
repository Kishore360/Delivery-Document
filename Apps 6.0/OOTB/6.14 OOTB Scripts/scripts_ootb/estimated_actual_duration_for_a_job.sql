select dp.name,d.build_number,trim(to_char(coalesce(round((sum(f.estimated_duration)),0),0), '9,999,999,990'))
 estimated_build_duration,trim(to_char(coalesce(round((sum(f.actual_duration)),0),0), '9,999,999,990')) actual_build_duration 
from int_61d2_mdwdb.f_build_run f
join int_61d2_mdwdb.d_build_run d
on f.build_run_key=d.row_key
join int_61d2_mdwdb.d_build_project dp
	on f.build_project_key=dp.row_key
join  (
SELECT lov.*, lov.dimension_code AS ci_state_code1, lov.dimension_name AS ci_state1
FROM int_61d2_mdwdb.d_lov lov
 -- JOIN int_61d2_mdwdb.d_lov_map br ON lov.row_key = br.src_key
where lov.dimension_class = 'STATE~BUILD'
UNION 
SELECT lov.*, lov.dimension_code AS ci_state_code1, lov.dimension_name AS ci_state1
FROM int_61d2_mdwdb.d_lov lov
WHERE lov.row_key = -1 OR lov.row_key = 0) lov_wh1
on d.build_state_src_key = lov_wh1.row_key
join  (
SELECT lov.*, lov.dimension_code AS ci_state_code, lov.dimension_name AS ci_state
FROM int_61d2_mdwdb.d_lov lov
where lov.dimension_class = 'CLASS~BUILD'
union
SELECT lov.*, lov.dimension_code AS ci_state_code, lov.dimension_name AS ci_state
FROM int_61d2_mdwdb.d_lov lov
WHERE lov.row_key = -1 OR lov.row_key = 0) lov_wh
on d.build_class_key = lov_wh.row_key
join (
SELECT lov.*, lov.dimension_code AS ci_project_code, lov.dimension_name AS ci_project
FROM int_61d2_mdwdb.d_lov lov
where lov.dimension_class = 'BUILDPROJECT~CLASS'
union
SELECT lov.*, lov.dimension_code AS ci_project_code, lov.dimension_name AS ci_project
FROM int_61d2_mdwdb.d_lov lov
WHERE lov.row_key = -1 OR lov.row_key = 0)lov_wh2
on dp.buildproject_class_key=lov_wh2.row_key	 
join int_61d2_mdwdb.d_calendar_date dt
on dt.row_key=f.build_start_on_key
join int_61d2_mdwdb.d_calendar_date dc
on dc.row_key=dt.month_start_date_key
where (dc.lagging_count_of_month between 0 and 12  )
group by dp.name,d.build_number
order by lower(dp.name),lower(d.build_number);

