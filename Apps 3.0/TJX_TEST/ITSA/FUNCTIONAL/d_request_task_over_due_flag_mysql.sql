select 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_item.over_due_flag' ELSE 'SUCCESS' END as Message
FROM (select count(1) as CNT
FROM  tjx_mdwdb.d_request_task REQ_ITM 
 JOIN  tjx_mdwdb.f_request_task a11 on  (a11.request_item_key = TRGT.row_key)
join tjx_mdwdb.d_request_item a19 
on (a11.request_item_key = a19.row_key) 
 WHERE category_name_c in ('ARMS') and  REQ_ITM.over_due_flag <> CASE WHEN (REQ_ITM.active_flag = 'Y') && (REQ_ITM.due_on < (select max(lastupdated) AS lastupdated
FROM tjx_mdwdb.d_o_data_freshness  JOIN  tjx_mdwdb.f_request_task a11 on  (a11.request_item_key = TRGT.row_key)
join tjx_mdwdb.d_request_item a19 
on (a11.request_item_key = a19.row_key) 
 WHERE category_name_c in ('ARMS') and sourcename like 'ServiceNow%' and etl_run_number=REQ_ITM.etl_run_number)) THEN 'Y' ELSE 'N' END)a;
