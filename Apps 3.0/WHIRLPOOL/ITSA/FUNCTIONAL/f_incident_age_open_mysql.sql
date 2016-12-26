
 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message 
from whirlpool_mdsdb.incident_final  SRC 
  join whirlpool_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )

JOIN whirlpool_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN' and br.dimension_class = 'STATE~INCIDENT'
LEFT JOIN (
select source_id,max(lastupdated) as lastupdated from  whirlpool_workdb.d_o_data_freshness
group by source_id
) df ON f.source_id = df.source_id
where if(timestampdiff(SECOND, SRC.opened_at, CONVERT_TZ(df.lastupdated,'America/New_York','GMT'))>0,
timestampdiff(SECOND, SRC.opened_at, CONVERT_TZ(df.lastupdated,'America/New_York','GMT')),0)<>f.age
