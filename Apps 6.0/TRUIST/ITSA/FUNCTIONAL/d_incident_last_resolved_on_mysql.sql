SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.last_resolved_on' ELSE 'data matched' END as
 Message from (
select count(1) as cnt  FROM (select * from truist_mdsdb.incident_final where cdctype<>'D')  SRC  
 JOIN truist_mdwdb.d_incident TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
WHERE 
convert_tz(SRC.resolved_at,'GMT','America/New_York')  
<> TRGT.last_resolved_on)x
