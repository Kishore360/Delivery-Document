select 
FE.test_suite_key,
count(distinct FE.test_execution_key) as tot_test_exe,
case when count(distinct case when upper(status_te.wi_sts) = 'PASSED' then FE.test_execution_key else null end ) = 0 then ''
else cast(count(distinct case when upper(status_te.wi_sts) = 'PASSED' then FE.test_execution_key else null end) as varchar(50)) end  as te_passed_count,
case when count(distinct case when upper(status_te.wi_sts) = 'FAILED' then FE.test_execution_key else null end ) = 0 then ''
else cast(count(distinct case when upper(status_te.wi_sts) = 'FAILED' then FE.test_execution_key else null end) as varchar(50)) end  as te_failed_count,
case when count(distinct case when upper(status_te.wi_sts) = 'BLOCKED' then FE.test_execution_key else null end ) = 0 then ''
else cast(count(distinct case when upper(status_te.wi_sts) = 'BLOCKED' then FE.test_execution_key else null end) as varchar(50)) end  as te_blocked_count,
case when count(distinct case when upper(status_te.wi_sts) = 'SKIPPED' then FE.test_execution_key else null end ) = 0 then ''
else cast(count(distinct case when upper(status_te.wi_sts) = 'SKIPPED' then FE.test_execution_key else null end) as varchar(50)) end  as te_skipped_count
from #DWH_TABLE_SCHEMA.f_test_execution FE
join #DWH_TABLE_SCHEMA.d_test_execution DE
on FE.test_execution_key = DE.row_key
join #DWH_TABLE_SCHEMA.d_test_suite DS
on DS.row_key = FE.test_suite_key
join 
(SELECT lov.*, wh_lov.dimension_code AS sts_code, wh_lov.dimension_name AS wi_sts, lov.dimension_name sor_lov_name FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATUS~TEST_EXECUTION' UNION 
 SELECT lov.*, lov.dimension_code AS sts_code, lov.dimension_name AS type, lov.dimension_name AS sor_lov_name FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) status_te
on status_te.row_key = DE.execution_status_src_key
group by FE.test_suite_key