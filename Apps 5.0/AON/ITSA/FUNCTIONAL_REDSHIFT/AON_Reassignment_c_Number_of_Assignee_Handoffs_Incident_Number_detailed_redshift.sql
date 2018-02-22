

SELECT b.incident_number,max(b.reassignee_count) as Number_of_Assignee_Handoffs_Incident_Number
FROM ldb.f_incident_activity a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key 
JOIN ldb.d_calendar_date c ON a.assigned_on_key=c.row_key
where c.lagging_count_of_month between 0 and 12 
group by 1
