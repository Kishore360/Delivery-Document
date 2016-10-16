SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (select count(1) as cnt from
cardinalhealth_mdwdb.f_change_request f
JOIN cardinalhealth_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN'
JOIN cardinalhealth_mdwdb.d_change_request a ON a.row_key = f.change_request_key
JOIN (SELECT 
			MAX(lastupdated) AS lastupdated, 
			source_id 
	  FROM cardinalhealth_mdwdb.d_o_data_freshness
      GROUP BY source_id)dat ON f.source_id = dat.source_id
WHERE DATEDIFF(lastupdated, a.opened_on) <> f.change_request_age)a

