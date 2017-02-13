 select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM <<tenant>>_mdsdb.incident_final SRC 
  JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 left join <<tenant>>_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 where lm.dimension_class = 'STATE~INCIDENT'
AND  lm.dimension_wh_code in  ('RESOLVED','CLOSED')
AND 0<> TRGT.dormancy_age )b
