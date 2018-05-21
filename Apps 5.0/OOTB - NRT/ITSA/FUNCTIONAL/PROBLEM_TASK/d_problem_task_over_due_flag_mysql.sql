SELECT 
CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT>0 THEN 'MDS to DWH data Validation failed for d_problem_taks_over_due_flag' ELSE 'SUCCESS' END AS MESSAGE
FROM (
SELECT count(1) as CNT
FROM <<tenant>>_mdwdb.d_problem_task PRB_TSK
JOIN <<tenant>>_mdwdb.f_problem_task TRGT ON PRB_TSK.row_key=TRGT.problem_task_key
JOIN <<tenant>>_mdwdb.d_lov_map LKP ON TRGT.state_src_key=LKP.row_key AND LKP.dimension_wh_code='OPEN'
where (src.cdctime<=f1.lastupdated) and PRB_TSK.soft_deleted_flag='N' AND 
PRB_TSK.over_due_flag <> CASE WHEN(PRB_TSK.active_flag='Y') &&
(PRB_TSK.due_on < (SELECT MAX(lastupdated) AS lastupdated FROM <<tenant>>_mdwdb.d_o_data_freshness
where (src.cdctime<=f1.lastupdated) and sourcename like 'ServiceNow%' and etl_run_number=PRB_TSK.etl_run_number)) THEN 'Y' ELSE 'N' END)temp;