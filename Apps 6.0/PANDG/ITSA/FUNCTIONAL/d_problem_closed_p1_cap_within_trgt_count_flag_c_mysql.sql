
SELECT 
CASE WHEN count(1) > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) > 0  THEN 'MDS to DWH data validation failed for d_request_item.closed_p1_cap_within_trgt_count_flag_c' ELSE 'SUCCESS' END as Message 
FROM (
SELECT a11.row_id,a11.closed_p1_cap_within_trgt_count_flag_c,f_prb.assignment_group_key =0 
FROM pandg_mdwdb.d_problem a11
JOIN pandg_mdwdb.f_problem f_prb ON a11.row_key = f_prb.problem_key
JOIN pandg_mdwdb.d_lov_map lv_mp ON a11.state_src_key = lv_mp.src_key AND (lv_mp.dimension_class ='STATE~PROBLEM' OR lv_mp.row_key in(0,-1)) 
JOIN pandg_mdwdb.d_internal_organization d_org ON f_prb.assignment_group_key = d_org.row_key
JOIN pandg_mdwdb.d_lov pr_lv ON f_prb.priority_src_key = pr_lv.row_key
JOIN pandg_mdwdb.d_lov st_lv ON f_prb.state_src_key = st_lv.row_key
JOIN pandg_mdwdb.d_lov sfa_lv ON a11.sfa_status_c_key = sfa_lv.row_key

JOIN (SELECT d_prb.row_key as problem_key,count(1) AS cnt,SUM(IF(a11.outcome_flag='N',1,0)) as non_breached
FROM pandg_mdwdb.f_task_sla a11
JOIN pandg_mdwdb.d_problem d_prb ON a11.problem_key = d_prb.row_key 
JOIN pandg_mdwdb.d_task_sla a12 ON a11.sla_key = a12.row_key
JOIN pandg_mdwdb.d_lov a13 ON a11.stage_src_key = a13.row_key
where 
a11.task_type='PROBLEM'
AND a12.sla_name like 'OEG_PrbCAP%'
AND a12.sla_name like '%P1%'
AND a13.dimension_name <> 'Cancelled'
GROUP BY 1
)sla ON f_prb.problem_key = sla.problem_key

WHERE a11.closed_p1_cap_within_trgt_count_flag_c <>
	CASE WHEN 
	(f_prb.assignment_group_key = 0 
		OR assignment_group_type_c like '%ITSM Role Provisioning Group%'
		OR assignment_group_type_c like '%ITSM IA Distribution L	ist%'
		OR assignment_group_type_c like '%ITSM Change Advisory Board%'
		OR assignment_group_type_c like '%ITSM Assignment Group%'
	) 
	AND a11.problem_number LIKE 'PRB%'
	AND pr_lv.dimension_code = 1 
	AND sla.non_breached >0 
	AND lv_mp.dimension_wh_code IN ('CLOSED','RESOLVED') 
	THEN 'Y' ELSE 'N' END
) temp;