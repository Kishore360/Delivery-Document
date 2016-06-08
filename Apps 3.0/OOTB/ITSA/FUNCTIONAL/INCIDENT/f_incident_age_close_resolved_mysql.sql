SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM
<<tenant>>_mdwdb.f_incident f
JOIN <<tenant>>_mdwdb.d_lov_map br ON f.state_src_key = br.src_key 
AND br.dimension_class = 'STATE~INCIDENT'
AND br.dimension_wh_code = 'OPEN'
JOIN <<tenant>>_mdwdb.d_incident a ON a.row_key = f.incident_key
AND f.source_id = a.source_id
JOIN (SELECT source_id,max(lastupdated) AS lastupdated
  from <<tenant>>_mdwdb.d_o_data_freshness
  GROUP BY 1) df ON f.source_id = df.source_id
  WHERE
if(timestampdiff(DAY, CONVERT_TZ(a.opened_on,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>), CONVERT_TZ(df.lastupdated,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>))>0,
timestampdiff(DAY, CONVERT_TZ(a.opened_on,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>), CONVERT_TZ(df.lastupdated,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)),0) <> f.age
