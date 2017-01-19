SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for d_enhancement_rm_c' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.incident_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
    left join cardinalhealth_mdwdb.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)
where lm.dimension_class = 'STATE~INCIDENT'
AND   lm.dimension_wh_code = 'OPEN' and
timestampdiff(SECOND,CONVERT_TZ(TRGT.changed_on,'America/New_York','GMT'),convert_tz((SELECT MAX(lastupdated) AS lastupdated
FROM cardinalhealth_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),'America/New_York','GMT')) <> 
TRGT.dormancy_age; 