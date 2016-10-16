SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (select count(1) as cnt from						   
							   cardinalhealth_mdwdb.f_change_request f 
JOIN cardinalhealth_mdwdb.d_lov_map br ON f.state_src_key = br.src_key 
	AND br.dimension_wh_code='OPEN' 
where f.actual_duration <> 0)a