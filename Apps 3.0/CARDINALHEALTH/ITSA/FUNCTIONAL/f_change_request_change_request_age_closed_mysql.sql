
SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (select count(1) as cnt from
cardinalhealth_mdwdb.f_change_request f
JOIN cardinalhealth_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code='CLOSED'
JOIN cardinalhealth_mdwdb.d_change_request a ON a.row_key = f.change_request_key
                          
WHERE f.change_request_age <> (CASE
                               WHEN a.opened_on<a.closed_on THEN timestampdiff(SECOND, a.opened_on,a.closed_on)
                               ELSE 0  END))a