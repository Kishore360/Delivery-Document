 select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message from ( select count(1) cnt 
 FROM mcdonalds_mdsdb.incident_task_final SRC 
  JOIN mcdonalds_mdwdb.f_incident_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 JOIN mcdonalds_mdwdb.d_incident_task_c trgtf on TRGT.incident_task_c_key=trgtf.row_key
 left join mcdonalds_mdwdb.d_lov_map lm 
 ON (lm.src_key = trgtf.state_src_key)
 where
 (COALESCE(TIMESTAMPDIFF(SECOND,SRC.sys_updated_on,CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM mcdonalds_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%' ),'America/Los_Angeles','GMT')),0)- TRGT.dormancy_age) not in  (3600,-3600) and 
 lm.dimension_class = 'STATE~INCIDENT_TASK'
AND  lm.dimension_wh_code = 'OPEN'  
AND COALESCE(TIMESTAMPDIFF(SECOND,SRC.sys_updated_on,CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM mcdonalds_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%' ),'America/Los_Angeles','GMT')),0)<> TRGT.dormancy_age )a
 
 


 
 