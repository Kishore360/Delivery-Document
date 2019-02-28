SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for incident.u_category' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM tjxco_mdwdb.d_change_request  a
join tjxco_mdwdb.f_change_request b
ON b.change_request_key = a.row_key 
JOIN tjxco_mdwdb.d_lov_map  c
ON b.risk_src_key =c.src_key
where b.schedule_change_risk_c <>CASE WHEN c.dimension_wh_code  = 'Very Low' THEN 1
WHEN c.dimension_wh_code  = 'Low' THEN 2
WHEN c.dimension_wh_code  = 'Moderate' THEN 3 
WHEN c.dimension_wh_code  = 'High' THEN 5
WHEN c.dimension_wh_code  = 'Very High' THEN 8 END
) temp;