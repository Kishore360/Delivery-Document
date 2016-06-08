
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt FROM
<<tenant>>_mdwdb.f_incident f
JOIN <<tenant>>_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN'
JOIN <<tenant>>_mdwdb.d_incident a ON a.row_key = f.incident_key
AND f.source_id = a.source_id
JOIN <<tenant>>_mdwdb.d_o_data_freshness df ON f.source_id = df.source_id
and df.etl_run_number = (select max(etl_run_number) from homedepot_mdwdb.f_incident f)
  WHERE
if(timestampdiff(DAY, CONVERT_TZ(a.opened_on,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>), 
CONVERT_TZ(df.lastupdated,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>))>0,
timestampdiff(DAY, CONVERT_TZ(a.opened_on,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>), CONVERT_TZ(df.lastupdated,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)),0) <> f.age
  )a
  
 