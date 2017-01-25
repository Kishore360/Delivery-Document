	SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.catalog_item_key' ELSE 'SUCCESS' END as Message
from tivo_mdwdb.d_incident d
JOIN tivo_mdwdb.f_incident f ON d.row_key = f.incident_key
LEFT JOIN tivo_mdwdb.d_lov_map disposition ON f.disposition_src_c_key = disposition.src_key
AND disposition.dimension_class = 'DISPOSITION_CODE~INCIDENT'
LEFT JOIN tivo_mdwdb.d_lov_map issue_type ON f.issue_type_src_c_key = issue_type.src_key
AND issue_type.dimension_class = 'ISSUE_TYPE~INCIDENT'
LEFT JOIN tivo_mdwdb.d_lov_map priority ON f.priority_src_key = priority.src_key
AND priority.dimension_class = 'PRIORITY~TASK'
LEFT JOIN tivo_mdwdb.d_lov_map incident_state ON f.state_src_key = incident_state.src_key
AND incident_state.dimension_class = 'STATE~INCIDENT'
where 				  							  
  	d.non_sla_incidents_c_flag <> CASE
									 WHEN disposition.dimension_wh_code <> 'DUPLICATE'
										  AND incident_state.dimension_wh_code <> 'CANCELLED'
										  AND priority.dimension_wh_code = 'N/A' THEN 'Y'
									 ELSE 'N'
								 END