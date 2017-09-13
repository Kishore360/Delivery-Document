
SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
 FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
 left join schneider_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)  where lm.dimension_class = 'STATE~INCIDENT' AND  lm.dimension_wh_code = 'OPEN' 
JOIN (select max(lastupdated) as lastupdated,source_id from schneider_workdb.d_o_data_freshness group by source_id) df ON f.source_id = df.source_id
wHERE TIMESTAMPDIFF(SECOND,CONVERT_TZ(TRGT.changed_on,'America/Los_Angeles','GMT'), CONVERT_TZ(df.lastupdated,'America/Los_Angeles','GMT')) <> TRGT.dormancy_age) a;

 

