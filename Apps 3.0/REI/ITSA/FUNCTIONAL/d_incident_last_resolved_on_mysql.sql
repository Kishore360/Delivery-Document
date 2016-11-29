SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.last_resolved_on' ELSE 'data matched' END as
 Message  from (
select count(1) as cnt  FROM rei_mdsdb.incident_final SRC  LEFT JOIN rei_mdwdb.d_incident TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
left join rei_mdwdb.f_incident f on f.incident_key=TRGT.row_key
 WHERE 
 CONVERT_TZ(SRC.u_last_resolution_date,'GMT','America/Los_Angeles')
<> TRGT.last_resolved_on)x