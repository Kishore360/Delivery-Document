SELECT 
b.organization_name,Avg(a.assigned_duration)/86400.0 as Avg_Duration_of_OldAssignmentGroup_Days
FROM ldb.f_incident_activity a 
JOIN ldb.d_internal_organization_group_from b ON a.from_assignment_group_key=b.row_key
JOIN ldb.d_calendar_date c ON a.assigned_on_key=c.row_key
where c.lagging_count_of_month between 0 and 12 
group by 1;


