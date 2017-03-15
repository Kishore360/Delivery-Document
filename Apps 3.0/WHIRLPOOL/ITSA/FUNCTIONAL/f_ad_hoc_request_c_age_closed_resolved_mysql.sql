

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag' ELSE 'SUCCESS' END as Message 
 FROM (SELECT count(1) as CNT 
 from 
whirlpool_mdwdb.f_ad_hoc_request_c f
JOIN whirlpool_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('CLOSED',
                             'RESOLVED')
JOIN whirlpool_mdwdb.d_ad_hoc_request_c a ON a.row_key = f.ad_hoc_request_c_key
AND f.source_id = a.source_id
where f.age <> if(timestampdiff(SECOND, CONVERT_TZ(a.opened_on,'America/New_York','GMT'), CONVERT_TZ(coalesce(a.last_resolved_on, a.closed_on),'America/New_York','GMT'))>0,timestampdiff(SECOND, CONVERT_TZ(a.opened_on,'America/New_York','GMT'), CONVERT_TZ(coalesce(a.last_resolved_on, a.closed_on),'America/New_York','GMT')),0))temp


