

SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_item.over_due_flag' ELSE 'SUCCESS' END as Message
FROM (
SELECT count(1) as CNT
FROM aetna_mdwdb.d_request_item REQ_ITM 
join aetna_mdwdb.f_request_item f ON( REQ_ITM.row_key = f.request_item_key )
JOIN aetna_mdwdb.d_lov_map br ON (f.state_src_key = br.src_key AND br.dimension_wh_code = 'OPEN')
WHERE REQ_ITM.soft_deleted_flag ='N' 
and  REQ_ITM.over_due_flag <> CASE WHEN (REQ_ITM.active_flag = 'Y' and REQ_ITM.soft_deleted_flag ='N')
&& (REQ_ITM.due_on < (SELECT max(lastupdated) AS lastupdated FROM aetna_mdwdb.d_o_data_freshness 
WHERE sourcename like 'ServiceNow%'and etl_run_number=REQ_ITM.etl_run_number)) THEN 'Y' ELSE 'N' END)temp;
