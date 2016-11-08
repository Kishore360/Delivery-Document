SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
SELECT COUNT(1) as cnt FROM homedepot_mdsdb.incident_final a
join homedepot_mdwdb.d_incident d 
on a.sys_id = d.row_id and a.sourceinstance = d.source_id 
join homedepot_mdwdb.f_incident f
ON d.row_key = f.incident_key
WHERE f.major_incident_outage_c=CASE WHEN d.status_c<>'CLOSED - POST INCIDENT'
and (d.status_c is not null or d.ito_engaged_time_c is not null) 
then TIMESTAMPDIFF(SECOND,d.ito_engaged_time_c,d.last_resolved_on)
WHEN d.status_c='CLOSED - POST INCIDENT'
and (d.status_c is not null or d.ito_engaged_time_c is not null) 
THEN TIMESTAMPDIFF(SECOND,d.incident_start_c,d.last_resolved_on)
ELSE null END ) a;
