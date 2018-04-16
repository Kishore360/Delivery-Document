
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_enhancement_rm.age' ELSE 'SUCCESS' END as Message 
 FROM (SELECT count(1) as CNT 
 from 
   cardinalhealth_mdwdb.f_enhancement_rm f
JOIN cardinalhealth_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN' AND br.dimension_class = 'STATE_C~RM_ENHANCEMENT' 
JOIN cardinalhealth_mdwdb.d_enhancement_rm_c a ON a.row_key = f.enhancement_c_key
AND f.source_id = a.source_id
JOIN cardinalhealth_mdwdb.d_o_data_freshness df ON f.source_id = df.source_id
where  TIMESTAMPDIFF(SECOND,a.opened_date,(SELECT CONVERT_TZ(MAX(lastupdated),'America/New_York','GMT') AS lastupdated 
FROM cardinalhealth_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))<> f.age)temp