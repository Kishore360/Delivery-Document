SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_problem.resolved_duration_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as CNT from wpl_mdwdb.f_problem a11
left join wpl_mdsdb.problem_final problem
 on  a11.row_id=problem.sys_id and a11.source_id=problem.sourceinstance
 where  (a11.resolved_duration_c<> timestampdiff(second, CONVERT_TZ (problem.sys_created_on, 'GMT','America/New_York'),CASE when COALESCE((SELECT  dimension_wh_code FROM wpl_mdwdb.d_lov_map WHERE  d_lov_map.dimension_class = 'STATE~PROBLEM'  AND d_lov_map.dimension_code = problem.state AND d_lov_map.source_id = problem.sourceinstance), 'UNKNOWN') = 'OPEN' then NULL when COALESCE((SELECT   dimension_wh_code  FROM wpl_mdwdb.d_lov_map WHERE d_lov_map.dimension_class = 'STATE~PROBLEM' AND d_lov_map.dimension_code = problem.state AND d_lov_map.source_id = problem.sourceinstance), 'UNKNOWN') in ('CLOSED', 'RESOLVED' ) then  coalesce(CONVERT_TZ (problem.u_resolved_date, 'GMT', 'America/New_York'), CONVERT_TZ (problem.closed_at, 'GMT', 'America/New_York'), CONVERT_TZ (problem.sys_updated_on, 'GMT', 'America/New_York')) end)
and problem.cdctype<>'D'))der;