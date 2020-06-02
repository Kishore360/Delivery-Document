
select a.name as name,a.build_number as build_number,concat(a.month_name_abbreviated::text, concat(' '::text, "substring"(a.week_start_date_key::text, 7, 8))) wk_nm,
trim(to_char(coalesce(round(a._test_total,2),0), '9,999,999,990')) _test_total,
trim(to_char(coalesce(round(a._test_fail,2),0), '9,999,999,990')) _test_fail,
trim(to_char(coalesce(round(a._test_pass,2),0), '9,999,999,990')) _test_pass,
trim(to_char(coalesce(round (a._test_skip,2),0), '9,999,999,990')) _test_skip 
from 
(select 	dp.name,wc.week_name,sum(f.AUTOMATED_TEST_TOTAL_COUNT)test_total,wc.week_start_date_key,wc.month_name_abbreviated,d.build_number,
sum(f.AUTOMATED_TEST_TOTAL_COUNT) _test_total,sum(f.AUTOMATED_TEST_FAIL_COUNT)_test_fail,sum(f.AUTOMATED_TEST_PASS_COUNT)_test_pass,sum(f.AUTOMATED_TEST_SKIP_COUNT)_test_skip
		 from #DWH_TABLE_SCHEMA.f_build_run	f	
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
		join #DWH_TABLE_SCHEMA.d_calendar_date wc
           on wc.row_key=dt.week_start_date_key
    where (dc.lagging_count_of_month between 0 and 12  )

 

group by dp.name,wc.week_name,wc.week_start_date_key,wc.month_name_abbreviated,build_number
order by lower(dp.name),lower(build_number))a

