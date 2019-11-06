SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.age' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 from
   whirlpool_mdwdb.f_ad_hoc_request_c f
JOIN whirlpool_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN'
JOIN whirlpool_mdwdb.d_ad_hoc_request_c a ON a.row_key = f.ad_hoc_request_c_key
AND f.source_id = a.source_id
JOIN (select  max(lastupdated) lastupdated,source_id from whirlpool_mdwdb.d_o_data_freshness where source_id=2) df   ON f.source_id = df.source_id
where f.age <> if(timestampdiff(SECOND, CONVERT_TZ(a.opened_on,'America/New_York','GMT'), CONVERT_TZ(df.lastupdated,'America/New_York','GMT'))>0,timestampdiff(SECOND, CONVERT_TZ(a.opened_on,'America/New_York','GMT'), CONVERT_TZ(df.lastupdated,'America/New_York','GMT')),0))temp