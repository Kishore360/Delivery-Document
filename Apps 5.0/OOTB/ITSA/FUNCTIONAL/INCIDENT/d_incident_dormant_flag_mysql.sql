 select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message
  FROM (select * from <<tenant>>_mdsdb.incident_final where cdctype<>'D') SRC 
   JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
 join <<tenant>>_mdwdb.d_incident TRGT1 
 on TRGT1.row_key = TRGT.incident_key   join 
 <<tenant>>_mdwdb.d_lov_map  lov_map 
 ON (lov_map.src_key = TRGT.state_src_key and dimension_class = 'STATE~INCIDENT' and dimension_wh_code = 'OPEN')
	left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = kb.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and ( case when timestampdiff(DAY,TRGT1.changed_on, df.lastupdated)>30 then 'Y' else  'N ' end ) <> TRGT1.dormant_flag ;