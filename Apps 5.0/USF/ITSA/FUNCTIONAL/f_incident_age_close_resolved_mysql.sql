SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT COUNT(1) as cnt FROM  usf_mdwdb.f_incident f
JOIN usf_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('CLOSED',
                             'RESOLVED')
JOIN usf_mdwdb.d_incident a ON a.row_key = f.incident_key
AND f.source_id = a.source_id
where f.age <>if
(timestampdiff(SECOND, CONVERT_TZ(a.opened_on,'US/Pacific','GMT'),
CONVERT_TZ(coalesce(a.last_resolved_on, a.closed_on),'US/Pacific','GMT'))>0,
timestampdiff(SECOND, CONVERT_TZ(a.opened_on,'US/Pacific','GMT'),
CONVERT_TZ(coalesce(a.last_resolved_on, a.closed_on),'US/Pacific','GMT')),0) 
)
 temp;
 