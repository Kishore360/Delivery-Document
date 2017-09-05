SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.last_resolved_on_key' ELSE 'SUCCESS' END as Message from
 (select count(1) cnt 
FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
JOIN schneider_mdwdb.d_lov_map LKP 
ON TRGT.state_src_key = LKP.src_key and TRGT.state_src_code=LKP.dimension_code 
and LKP.dimension_class = 'STATE~INCIDENT' AND LKP.dimension_wh_code IN('RESOLVED','CLOSED') and TRGT.last_resolved_on_key is null
left join schneider_mdwdb.d_calendar_date cal 
on cal.row_id = DATE_FORMAT(TRGT.changed_on,'%Y%m%d')
where coalesce(TRGT.closed_on_key,cal.row_key)<> TRGT.last_resolved_on_key)a;

