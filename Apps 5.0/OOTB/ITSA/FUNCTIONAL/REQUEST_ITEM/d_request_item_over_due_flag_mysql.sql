SELECT
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_item.over_due_flag' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT 

 FROM  <<tenant>>_mdwdb.d_request_item REQ_ITM 
WHERE REQ_ITM.soft_deleted_flag ='N' and  REQ_ITM.over_due_flag <> CASE WHEN (REQ_ITM.active_flag = 'Y' and REQ_ITM.soft_deleted_flag ='N') && (REQ_ITM.due_on < (SELECT max(lastupdated) AS lastupdated
FROM <<tenant>>_mdwdb.d_o_data_freshness 
WHERE sourcename like 'ServiceNow%'and etl_run_number=REQ_ITM.etl_run_number)) THEN 'Y' ELSE 'N' END)temp;


