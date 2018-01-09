SELECT count(a.incident_key) AS Resolved_Incidents_Missed_Any_SLAs
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key 
WHERE b.met_sla_flag='N'
and d.lagging_count_of_month between 0 and 11 