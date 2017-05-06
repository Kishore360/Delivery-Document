SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.computer_usage_c' ELSE 'SUCCESS' END as Message from
(select count(1) as cnt
FROM usf_mdwdb.d_request_item di
  JOIN usf_mdwdb.f_request_item fi ON di.row_key = fi.request_item_key
  JOIN usf_mdwdb.d_lov_map dlm ON fi.state_src_key = dlm.src_key
  JOIN usf_mdwdb.d_master_item m ON fi.catalog_item_key = m.row_key
  JOIN usf_mdwdb.d_calendar_date c ON fi.delevered_on_c_key = c.row_key
  JOIN (
			SELECT lastupdated, 
				   source_id
			  FROM usf_mdwdb.d_o_data_freshness
			
	) df ON di.source_id = df.source_id
WHERE case when (dlm.dimension_class = 'STATE~SC_REQ_ITEM' AND dlm.dimension_wh_code = 'OPEN' AND m.item_name like '%refresh%' AND YEAR(df.lastupdated)<c.year_id+1) then 'Y' else'N' end<> di.in_progress_c_flag)t;