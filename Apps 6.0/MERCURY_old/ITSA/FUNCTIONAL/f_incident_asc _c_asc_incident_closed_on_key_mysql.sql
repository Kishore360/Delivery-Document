SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercury_mdwdb.f_incident_asc_c f
JOIN mercury_mdsdb.u_asc_ticket_final br 
ON f.row_id = br.sys_id and f.source_id=br.sourceinstance
JOIN mercury_mdwdb.d_calendar_date a 
ON 	COALESCE(DATE_FORMAT(CONVERT_TZ(br.closed_at,'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')=a.row_id
where coalesce(a.row_key,case when br.closed_at is null then 0 else -1 end)<>f.asc_incident_closed_on_key
