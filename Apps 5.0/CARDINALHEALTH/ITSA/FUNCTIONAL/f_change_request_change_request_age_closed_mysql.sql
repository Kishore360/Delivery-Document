SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (select count(1) as cnt from
(select sys_id,sourceinstance,opened_at,closed_at from cardinalhealth_mdsdb.change_request_final SRC where opened_at <closed_at) SRC 
join cardinalhealth_mdwdb.f_change_request f on SRC.sys_id=f.row_id and SRC.sourceinstance=f.source_id
JOIN cardinalhealth_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code='CLOSED'                
WHERE f.change_request_age <> timestampdiff(second,CONVERT_TZ(SRC.opened_at,'America/New_York','GMT'),
CONVERT_TZ(SRC.closed_at,'America/New_York','GMT')) )a 