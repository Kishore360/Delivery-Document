 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_work_order.dormant_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt  
  FROM 
schneider_mdwdb.d_work_order di
  JOIN schneider_mdwdb.f_work_order fi ON di.row_key = fi.work_order_key
  JOIN schneider_mdwdb.d_lov_map dlm ON fi.state_src_key = dlm.src_key  	
  where  STATUS <= Resolved and dlm.dimension_class = 'STATE~WORKORDER'
  AND dlm.dimension_wh_code = 'OPEN'
  AND  (CASE WHEN timestampdiff(DAY,di.LAST_MODIFIED_DATE , (SELECT MAX(lastupdated) AS lastupdated
FROM schneider_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%' and etl_run_number=fi.etl_run_number))>30 THEN 'Y' ELSE 'N' END) <> di.dormant_flag)a;

