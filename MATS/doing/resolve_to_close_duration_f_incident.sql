SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from <<tenant>>_mdwdb.f_incident a
inner join <<tenant>>_mdwdb.d_incident b on a.incident_key=b.row_key
where  resolve_to_close_duration <> TIMESTAMPDIFF(SECOND,last_resolved_on,closed_on) and
(last_resolved_on>0 or last_resolved_on is not null) and (closed_on>0 and closed_on is not null))c;
 