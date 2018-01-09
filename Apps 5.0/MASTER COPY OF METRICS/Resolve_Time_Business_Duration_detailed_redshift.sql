


SELECT sum(a.business_duration_c)/86400.00 as Resolve_Time_Business_Duration
FROM ldb.f_incident_resolved a 
JOIN ldb.d_calendar_date b ON a.last_resolved_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key 
where c.lagging_count_of_month between 0 and 12
