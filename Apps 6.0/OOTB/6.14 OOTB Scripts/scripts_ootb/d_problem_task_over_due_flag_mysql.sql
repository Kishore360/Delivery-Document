SELECT 
CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT>0 THEN 'MDS to DWH data Validation failed for d_problem_taks_over_due_flag' ELSE 'SUCCESS' END AS MESSAGE
FROM (
SELECT count(1) as CNT
FROM #DWH_TABLE_SCHEMA.d_problem_task PRB_TSK
JOIN #DWH_TABLE_SCHEMA.f_problem_task TRGT ON PRB_TSK.row_key=TRGT.problem_task_key
JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP ON TRGT.state_src_key=LKP.row_key AND LKP.dimension_wh_code='OPEN'
WHERE PRB_TSK.soft_deleted_flag='N' AND 
PRB_TSK.over_due_flag <> CASE WHEN(PRB_TSK.active_flag='Y') &&
(PRB_TSK.due_on < (SELECT MAX(lastupdated) AS lastupdated FROM asu_mdwdb.d_o_data_freshness
WHERE sourcename like 'ServiceNow%' and etl_run_number=PRB_TSK.etl_run_number)) THEN 'Y' ELSE 'N' END)temp;