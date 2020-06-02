SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_task.over_due_flag' ELSE 'SUCCESS' END as Message
FROM (
SELECT count(1) as CNT
FROM #DWH_TABLE_SCHEMA.d_request_task REQ_TSK 
join #DWH_TABLE_SCHEMA.f_request_task f ON ( REQ_TSK.row_key = f.request_task_key )
JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN'
WHERE REQ_TSK.soft_deleted_flag ='N' and  
REQ_TSK.over_due_flag <> CASE WHEN (REQ_TSK.active_flag = 'Y' and REQ_TSK.soft_deleted_flag ='N') && 
(REQ_TSK.due_on < (SELECT max(lastupdated) AS lastupdated FROM asu_mdwdb.d_o_data_freshness 
WHERE sourcename like 'ServiceNow%'and etl_run_number=REQ_TSK.etl_run_number)) THEN 'Y' ELSE 'N' END)temp;