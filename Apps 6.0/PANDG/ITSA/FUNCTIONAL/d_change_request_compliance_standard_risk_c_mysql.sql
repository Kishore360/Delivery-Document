SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.compliance_standard_risk_c' ELSE 'SUCCESS' END as Message
 FROM
png_mdwdb.d_change_request a
JOIN png_mdwdb.f_change_request b 
ON a.row_key = b.change_request_key
JOIN png_mdwdb.d_lov_map state
on b.state_src_key = state.src_key
JOIN png_mdwdb.d_lov type
on a.service_type_src_c_key = type.row_key 
JOIN png_mdwdb.d_lov close
on a.close_code_src_key = close.row_key
JOIN png_mdwdb.d_lov risk
on a.risk_src_key = risk.row_key
JOIN png_mdwdb.d_lov impact
on b.impact_src_key = impact.row_key
JOIN png_mdwdb.d_lov type1
on a.type_src_key = type1.row_key

where state.dimension_wh_code = 'CLOSED' and type.dimension_name <> ('Non-Production') 
and type1.dimension_name = 'Standard'
and close.dimension_name not in ('Rejected', 'Withdrawn / Cancelled')
and (risk.dimension_name <> 'Low')
and a.compliance_standard_risk_c <> 'N' ;