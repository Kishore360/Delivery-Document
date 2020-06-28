SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.cause_code_c_key' ELSE 'SUCCESS' END as Message
 FROM (
 
 select count(1) as cnt from  
truist_mdwdb.f_incident f_incident   
INNER JOIN
truist_mdwdb.d_incident d_incident 
ON f_incident.incident_key=d_incident.row_key  
JOIN (
select source_id,max(lastupdated) as lastupdated from truist_mdwdb.d_o_data_freshness
group by source_id
) df ON f_incident.source_id = df.source_id
where
f_incident.days_since_last_incident <> DATEDIFF(CONVERT_TZ(df.lastupdated,'America/New_York','GMT'),CONVERT_TZ(d_incident.opened_on,'America/New_York','GMT')) and f_incident.soft_deleted_flag='N')ma; 
