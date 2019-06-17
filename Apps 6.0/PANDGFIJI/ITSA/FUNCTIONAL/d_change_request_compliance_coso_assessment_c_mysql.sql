SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.compliance_coso_assessment_c' ELSE 'SUCCESS' END as Message
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
JOIN png_mdwdb.tmp_change_request_assessment_c impact_c 
ON a.row_key = impact_c.change_request_c_key
LEFT JOIN png_mdwdb.tmp_mdw_change_request_assessment_c req 
ON b.change_request_key = req.change_request_c_key 
where state.dimension_wh_code = 'CLOSED' and type.dimension_name <> ('Non-Production') 
and type1.dimension_name = 'Normal'
and close.dimension_name not in ('Rejected', 'Withdrawn / Cancelled')
AND a.compliance_coso_assessment_c  <>  a.compliance_coso_assessment_c