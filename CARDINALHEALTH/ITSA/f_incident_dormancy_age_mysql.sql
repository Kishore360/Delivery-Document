SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.incident_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
    
    left join cardinalhealth_mdwdb.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)
left join(
SELECT lastupdated,source_id
FROM cardinalhealth_mdwdb.d_o_data_freshness
WHERE etl_run_number in (select max(etl_run_number) from cardinalhealth_mdwdb.d_o_data_freshness))df 
ON TRGT.source_id = df.source_id
where lm.dimension_class = 'STATE~INCIDENT'

AND   lm.dimension_wh_code = 'OPEN' and
DATEDIFF(convert_tz(df.lastupdated,'GMT','America/Los_Angeles'),TRGT.changed_on) <> TRGT.dormancy_age;