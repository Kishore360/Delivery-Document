SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_problem.resolution_code_src_c_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
FROM svb_mdwdb.d_incident di
  JOIN svb_mdwdb.f_incident fi ON di.row_key = fi.incident_key
  JOIN svb_mdwdb.d_lov_map dlm ON fi.state_src_key = dlm.src_key
 AND dlm.dimension_class = 'STATE~INCIDENT'
  AND dlm.dimension_wh_code = 'OPEN'
  JOIN (
			SELECT max(lastupdated) as lastupdated, 
				   source_id
			  FROM svb_mdwdb.d_o_data_freshness
		group by source_id
	) df ON di.source_id = df.source_id 
where case when  timestampdiff(DAY,di.changed_on, df.lastupdated)>30 then 'Y' else 'N' end<>di.dormant_flag
)b