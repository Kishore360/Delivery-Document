 select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.incident_final SRC 
   JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
 join <<tenant>>_mdwdb.d_incident TRGT1 
 on TRGT1.row_key = TRGT.incident_key   join 
 <<tenant>>_mdwdb.d_lov_map  lov_map 
 ON (lov_map.src_key = TRGT.state_src_key and dimension_class = 'STATE~INCIDENT' and dimension_wh_code = 'OPEN')
JOIN ( SELECT max(lastupdated) as lastupdated, source_id FROM <<tenant>>_mdwdb.d_o_data_freshness
	group by source_id 	) df ON TRGT.source_id = df.source_id
where ( case when timestampdiff(DAY,TRGT1.changed_on, df.lastupdated)>30 then 'Y' else  'N ' end ) <> TRGT1.dormant_flag ;