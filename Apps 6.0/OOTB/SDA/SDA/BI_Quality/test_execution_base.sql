drop table if exists #DWH_TABLE_SCHEMA.test_execution_cube_base;
create table #DWH_TABLE_SCHEMA.test_execution_cube_base As
select
 FE.test_execution_key
,PRJ.project_name as project
,PRJ.row_id as project_id
,DS.row_key as test_suite_key
,DS.row_id as test_suite
,D.work_item_number as wi_testcase 
,D.row_id as TC_id
,DE.execution_id as TE_number
,DE.execution_name as TE_name
,DE.row_key
,FE.test_result_status_key
,exe_by.user_name as TE_executed_by
,cred_by.user_name as TE_created_by
,DE.ended_on as TE_ended_on
,DE.error_count as TE_error_count
,DE.started_on as TE_started_on
,DE.execution_status_src_key as TE_status_sr
,DE.testcase_count as TE_testcase_count
,type.typ as TS_type
,status_tc.sor_lov_name as TC_status
,DE.request_count as TE_requestcount
,DE.user_count as TE_total_user
,FE.duration as duration
,case when  FE.test_execution_key is not null then 1 else 0 end as executed_tc
,case when upper(status_tc.wi_sts) = 'PASSED' and FE.test_execution_key is not null  then 1 else 0 end as passes_tc
,case when upper(status_tc.wi_sts) = 'FAILED' and FE.test_execution_key is not null  then 1 else 0 end as failed_tc
,case when upper(status_tc.wi_sts) = 'BLOCKED' and FE.test_execution_key is not null  then 1 else 0 end as blocked_tc
,case when upper(status_tc.wi_sts) = 'SKIPPED' and FE.test_execution_key is not null  then 1 else 0 end as skipped_tc
,sum(FE.duration)
--,max(FE.row_key)
from #DWH_TABLE_SCHEMA.f_test_execution FE
left join #DWH_TABLE_SCHEMA.d_test_execution DE
on FE.test_execution_key = DE.row_key
join #DWH_TABLE_SCHEMA.d_test_suite DS
on DS.row_key = FE.test_suite_key
join #DWH_TABLE_SCHEMA.d_work_item D
on D.row_key = FE.test_case_key
join #DWH_TABLE_SCHEMA.d_project PRJ
on PRJ.row_key = FE.project_key
join #DWH_TABLE_SCHEMA.d_internal_contact cred_by
on cred_by.row_key = DE.test_execution_created_by_key 
join #DWH_TABLE_SCHEMA.d_internal_contact exe_by
on exe_by.row_key = DE.executed_by_key
join 
(
 SELECT lov.*, wh_lov.dimension_code AS sts_code, wh_lov.dimension_name AS wi_sts, lov.dimension_name sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATUS~TEST_CASE_EXECUTION'
UNION 
 SELECT lov.*, lov.dimension_code AS sts_code, lov.dimension_name AS type, lov.dimension_name AS sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) status_tc
on status_tc.row_key = FE.test_result_status_key

 left join 
(
 SELECT lov.*, lov.dimension_code AS typ_code, lov.dimension_name AS typ, lov.dimension_name sor_lov_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov  where lov.dimension_class = 'TYPE~TEST_SUITE'
) type
on type.row_key = DS.test_suite_type_key

group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28