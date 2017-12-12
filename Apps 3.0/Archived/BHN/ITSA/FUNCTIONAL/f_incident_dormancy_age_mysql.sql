 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message
 FROM bhn_mdsdb.incident_final SRC 
 LEFT JOIN bhn_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 left join bhn_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 where 
 TIMESTAMPDIFF(DAY,SRC.sys_updated_on,
CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM bhn_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),
'America/Los_Angeles','GMT'))>=14 AND 
 lm.dimension_class = 'STATE~INCIDENT'
AND  lm.dimension_wh_code = 'OPEN'  
AND COALESCE(TIMESTAMPDIFF(DAY,SRC.sys_updated_on,CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM bhn_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),'America/Los_Angeles','GMT')),0)<> TRGT.dormancy_age 
 
 

