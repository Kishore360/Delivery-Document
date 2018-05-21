 select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM ( SELECT * FROM mcdonalds_mdsdb.incident_final where  cdctype<>'D') SRC 
  JOIN mcdonalds_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 left join mcdonalds_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 
 on (f1.source_id = SRC.sourceinstance)
  where (SRC.cdctime<=f1.lastupdated) and lm.dimension_class = 'STATE~INCIDENT'
AND  lm.dimension_wh_code = 'OPEN'  
AND COALESCE(TIMESTAMPDIFF(second,SRC.sys_updated_on,CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM mcdonalds_mdwdb.d_o_data_freshness where  sourcename like 'ServiceNow%' and etl_run_number=TRGT.etl_run_number),'US/Central','GMT')),0) 
and  (SRC.cdctime<=lastupdated) <> TRGT.dormancy_age )b