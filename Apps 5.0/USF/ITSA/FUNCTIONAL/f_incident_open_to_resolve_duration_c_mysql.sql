SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.open_to_resolve_duration' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM mercury_mdwdb.d_incident a
JOIN  mercury_mdwdb.f_incident f ON a.row_key = f.incident_key
JOIN mercury_mdwdb.d_lov_map lov_map
 ON (f.state_src_key = lov_map.src_key and lov_map.dimension_class = 'STATE~INCIDENT' )
and lov_map.dimension_wh_code in ('RESOLVED','CLOSED')

where 
f.open_to_resolve_duration_c<>case when coalesce(a.last_resolved_on,a.closed_on,a.changed_on)<a.opened_on then null else TIMESTAMPDIFF(SECOND,CONVERT_TZ(a.opened_on,'America/Los Angels','GMT'),
CONVERT_TZ(coalesce(a.last_resolved_on,a.closed_on,a.changed_on),'America/Los Angels','GMT')) end)temp