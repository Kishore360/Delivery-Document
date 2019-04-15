SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.compliant_with_change_policy_c' ELSE 'SUCCESS' END as Message
 FROM
 png_mdwdb.d_change_request a
JOIN png_mdwdb.f_change_request b 
ON a.row_key  = b.change_request_key
JOIN png_mdwdb.d_lov_map state
on b.state_src_key = state.src_key
JOIN png_mdwdb.d_lov type
on a.service_type_src_c_key = type.row_key 
JOIN png_mdwdb.d_lov close
on a.close_code_src_key = close.row_key
where 
state.dimension_wh_code = 'CLOSED' and type.dimension_name <> ('Non-Production') 
and close.dimension_name not in ('Rejected', 'Withdrawn / Cancelled')
and (a.compliance_standard_risk_c  = 'N' or a.compliance_cab_approval_c = 'N' 
or a.compliance_coso_assessment_c = 'N' or a.compliance_coso_approval_c = 'N' 
or a.compliance_dcab_approval_c = 'N' or a.compliance_ecab_approval_c = 'N' or a.compliance_tab_approval_c = 'N') 
and a.compliant_with_change_policy_c <> 'N' <> a.compliant_with_change_policy_c