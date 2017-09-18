 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_work_order.dormant_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt  
  FROM 
schneider_mdwdb.d_work_order di
  JOIN schneider_mdwdb.f_work_order fi ON di.row_key = fi.work_order_key
  JOIN schneider_mdwdb.d_lov_map dlm ON fi.state_src_key = dlm.src_key  and dlm.dimension_class = 'STATE~WORKORDER'   AND dlm.dimension_wh_code = 'OPEN'
  JOIN (
			SELECT max(lastupdated) as lastupdated, 
				   source_id
			  FROM schneider_mdwdb.d_o_data_freshness
		group by source_id
	) df ON di.source_id = df.source_id 
where (case when timestampdiff(DAY,di.changed_on, df.lastupdated) > 30 then 'Y' else 'N' end) <> di.dormant_flag) a;
  
  
  