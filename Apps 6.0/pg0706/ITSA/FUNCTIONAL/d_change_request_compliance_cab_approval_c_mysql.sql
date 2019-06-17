SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.compliance_cab_approval_c' ELSE 'SUCCESS' END as Message
 FROM
(
SELECT c.change_request_key, SUM(CASE WHEN ecab_flag_c ='Y' THEN 1 ELSE 0 END) as ecab_flag_count ,
SUM(CASE WHEN cab_flag_c ='Y' THEN 1 ELSE 0 END) as cab_flag_count ,
SUM(CASE WHEN tab_flag_c ='Y' THEN 1 ELSE 0 END) as tab_flag_count ,
SUM(CASE WHEN impact_flag_c ='Y' THEN 1 ELSE 0 END) as impac_flag_count ,
SUM(CASE WHEN cab_flag_c ='Y' and  b.dimension_name = 'Closed InComplete' THEN 1 ELSE 0 END) as cab_status_count ,

SUM(CASE WHEN cab_flag_c ='Y' and  b.dimension_name <> 'Closed Complete' THEN 1 ELSE 0 END) as emer_cab_status_count ,

SUM(CASE WHEN ecab_flag_c ='Y' and b.dimension_name = 'Closed Incomplete' THEN 1 ELSE 0 END) as ecab_status_count ,

SUM(CASE WHEN impact_flag_c ='Y' and b.dimension_name = 'Closed Incomplete' THEN 1 ELSE 0 END) as impac_status_count ,

SUM(CASE WHEN tab_flag_c ='Y' and b.dimension_name = 'Closed Incomplete' THEN 1 ELSE 0 END) as tab_status_count ,

SUM(CASE WHEN impact_flag_c ='Y' and c.assigned_to_key <> c.closed_by_key THEN 1 ELSE 0 END) as users_count ,
SUM(CASE WHEN impact_flag_c ='Y' and attach.name_c like '%COSO Approval%' and attach.name_c like CONCAT('%',owner.full_name,'%') THEN 1 ELSE 0 END) as attachemnt_count 
 from png_mdwdb.d_change_task a
JOIN png_mdwdb.d_lov b 
ON a.state_src_key = b.row_key 
JOIN png_mdwdb.f_change_task c 
ON a.row_key = c.change_task_key
JOIN png_mdwdb.f_change_request  chg 
ON c.change_request_key = chg.change_request_key
JOIN png_mdwdb.d_internal_contact  owner 
ON chg.owned_by_c_key = owner.row_key
LEFT JOIN png_mdwdb.d_sys_attachment_c attach
ON c.change_task_key = attach.change_task_c_key
group by 1) tmp
LEFT JOIN png_mdwdb.d_change_request a
ON a.row_key=tmp.change_request_key
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
and type1.dimension_name = 'Emergency'
and close.dimension_name not in ('Rejected', 'Withdrawn / Cancelled')
AND a.compliance_cab_approval_c  = CASE WHEN tmp.change_request_key is NULL OR tmp.ecab_flag_count = 0 
or (tmp.ecab_flag_count > 0 and tmp.emer_cab_status_count > 0) THEN 'N' ELSE a.compliance_cab_approval_c END ;