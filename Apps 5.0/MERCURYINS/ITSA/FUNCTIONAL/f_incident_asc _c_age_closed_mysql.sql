SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.notifind_sent_c_flag' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdwdb.f_incident_asc_c f
JOIN mercuryins_mdwdb.d_lov_map br ON f.asc_incident_state_c_key = br.src_key
AND br.dimension_wh_code IN ('CLOSED','RESOLVED')
JOIN mercuryins_mdwdb.d_incident_asc_c a ON a.row_key = f.incident_asc_c_key
AND f.source_id = a.source_id
where f.age <> timestampdiff(DAY, a.opened_on, coalesce(a.last_resolved_on, a.closed_on))