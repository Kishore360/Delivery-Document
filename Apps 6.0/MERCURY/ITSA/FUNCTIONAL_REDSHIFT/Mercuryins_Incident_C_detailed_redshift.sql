select '%_Opened_Incidents_last_to_last_30_days',((count((CASE WHEN a12.lagging_count_of_days between 0 and 29 THEN a11.row_key ELSE NULL END))-count((CASE WHEN a12.lagging_count_of_days between 30 and 59 THEN a11.row_key ELSE NULL END)) )*100*1.0)/count((CASE WHEN a12.lagging_count_of_days between 30 and 59 THEN a11.row_key ELSE NULL END)) as Metric_Value
from	ldb.f_incident	a11
join	ldb.d_calendar_date	a12
on 	(a11.opened_on_key = a12.row_key)
where	(a12.lagging_count_of_days between 30 and 59
 or a12.lagging_count_of_days between 0 and 29) 
 union
 select  '%_Priority_Escalated_Incidents_last_to_last_30_days',((count((CASE WHEN a13.lagging_count_of_days between 0 and 29 THEN a11.row_key ELSE NULL END)) -
count((CASE WHEN a13.lagging_count_of_days between 30 and 59 THEN a11.row_key ELSE NULL END)) )*100*1.0)/count((CASE WHEN a13.lagging_count_of_days between 30 and 59 THEN a11.row_key ELSE NULL END)) as Metric_Value
from	ldb.f_incident	a11
join	ldb.d_incident	a12
on 	(a11.incident_key = a12.row_key)
join	ldb.d_calendar_date	a13
on 	(a11.opened_on_key = a13.row_key)
where	(a12.priority_escalated_flag = 'Y'
 and (a13.lagging_count_of_days between 0 and 29
 or a13.lagging_count_of_days between 30 and 59))
 union
 select	'%_Reopened_Incidents_last_to_last_30_days',((count((CASE WHEN a13.lagging_count_of_days between 0 and 29 THEN a11.row_key ELSE NULL END))-count((CASE WHEN a13.lagging_count_of_days between 30 and 59 THEN a11.row_key ELSE NULL END)) )*100*1.0)/count((CASE WHEN a13.lagging_count_of_days between 30 and 59 THEN a11.row_key ELSE NULL END)) as Metric_Value
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
where	(a12.reopened_flag = 'Y'
 and (a13.lagging_count_of_days between 30 and 59
 or a13.lagging_count_of_days between 0 and 29)) 
union
SELECT 'All Incidents',Count(a.row_key) as Metric_Value
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 35
UNION
SELECT 'Auto Generated Incidents',Count(a.row_key) as Metric_Value
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 35
AND b.auto_generated_flag='Y'
UNION
SELECT 
'Avg_Problem_Days_since_Last_Update',
a.X/b.Y AS Metric_Value
FROM  
(select	sum((a11.dormancy_age / 86400.0)) AS X
from	ldb.f_incident	a11
join	ldb.d_incident	a12
on 	(a11.incident_key = a12.row_key)
join	ldb.d_incident_state	a13
on 	(a12.state_src_key = a13.row_key)
JOIN    ldb.d_calendar_date a14
ON   a11.opened_on_key=a14.row_key
where	a13.wh_dimension_code = 'OPEN' 
and a14.lagging_count_of_month between 0 and 35)a
CROSS JOIN
(select	count(a11.row_key) AS Y
from	ldb.f_incident	a11
join	ldb.d_incident	a12
on 	(a11.incident_key = a12.row_key)
JOIN    ldb.d_calendar_date a14
ON   a11.opened_on_key=a14.row_key
where	a12.backlog_flag = 'Y' 
and a14.lagging_count_of_month between 0 and 35)b
union
select	'Avg_of_incident_Age_Days',
(sum((a24.age / 86400.0))/count(a24.row_key)) AS Metric_Value
from	ldb.f_incident	a24
join	ldb.d_calendar_date	a12
on 	(a24.opened_on_key = a12.row_key)
join	ldb.d_calendar_month	a13
on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
select	'Backlog_Incidents',count(a11.row_key) AS Metric_Value
from	ldb.f_incident	a11
join	ldb.d_incident	a12
on 	(a11.incident_key = a12.row_key)
join	ldb.d_calendar_date	a13
on 	(a11.opened_on_key = a13.row_key)
join	ldb.d_calendar_month	a14
on 	(a13.month_start_date_key = a14.row_key)
where	(a12.backlog_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Closed_incidents',count(a24.row_key) AS Closed_incidents
from	ldb.f_incident_closed	a24
join	ldb.d_calendar_date	a12
on 	(a24.closed_on_key = a12.row_key)
join	ldb.d_calendar_month	a13
on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
UNION 
SELECT 
'Closed_Incidents_met_all_sla_percentage',
(a.Closed_Incident_met_all_sla/b.Closed_Incidents)*100 as Closed_Incident_met_all_sla_percentage
FROM 
(select	count(a24.row_key) AS Closed_Incident_met_all_sla
from	ldb.f_incident_closed	a24
join	ldb.d_incident	a12
on 	(a24.incident_key = a12.row_key)
join	ldb.d_calendar_date	a13
on 	(a24.closed_on_key = a13.row_key)
join	ldb.d_calendar_month	a14
on 	(a13.month_start_date_key = a14.row_key)
where	(a12.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35) 
) a 
CROSS JOIN 
(select	count(a24.row_key) AS Closed_Incidents
from	ldb.f_incident_closed	a24
join	ldb.d_calendar_date	a12
on 	(a24.closed_on_key = a12.row_key)
join	ldb.d_calendar_month	a13
on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35   
) b
union
select	'Current_Open_Incidents', count(a11.row_key) AS Current_Open_Incidents
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a11.opened_on_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	(a13.wh_dimension_code = 'OPEN'
 and a15.lagging_count_of_month between 0 and 35)
 union
 SELECT 'Current_Open_Incidents_percentage',round((a.X/b.Y)*100,0) AS metric_value
FROM  
(select	count(a11.row_key)*1.0 AS X
from	ldb.f_incident	a11
join	ldb.d_incident	a12
on 	(a11.incident_key = a12.row_key)
JOIN    ldb.d_calendar_date a14
ON   a11.opened_on_key=a14.row_key
where	a12.backlog_flag = 'Y' 
and a14.lagging_count_of_month between 0 and 35)a
CROSS JOIN
(select	count(a11.row_key)*1.0 AS Y
from	ldb.f_incident	a11
join	ldb.d_incident	a12
on 	(a11.incident_key = a12.row_key)
JOIN    ldb.d_calendar_date a14
ON   a11.opened_on_key=a14.row_key
where a14.lagging_count_of_month between 0 and 35)b
union
select	'Dormant_incidents',count(a24.row_key) AS metric_value
from	ldb.f_incident	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a24.incident_key = a13.row_key)
	join	ldb.d_incident_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a13.dormant_flag = 'Y'
 and a14.wh_dimension_code = 'OPEN'
 and a15.lagging_count_of_month between 0 and 35)
 union
select	'FCR',count(a11.row_key) AS First_call_resolution_incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.first_call_resolution_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Incident_Caused_by_Problem',count(a11.row_key) AS Incident_Caused_by_Problem
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.problem_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Incident_Open_To_Close_Duration',round(sum((a11.open_to_close_duration / 86400.0))/count(a11.row_key),1)
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
select	'Incident_Reassignment_Count',COALESCE(sum(a11.reassignment_count), 0) AS Incident_Reassignment_Count
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
select	'Incident_Reopened_count',sum(a11.reopened_count) AS Incident_reopened_count
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
 union
 select	'Incidents_Caused_by_change',count(a11.row_key) AS Caused_by_change
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.caused_by_change_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
union
select	'Incidents_causing_knowledge',count(a11.row_key) AS causing_knowledge
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.knowledge_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 SELECT 
'Incidents_fix_rates',a.resolved_incidents/b.opened_incidents*1.0 as fix_rate
FROM 
(select	count(a11.row_key) AS resolved_incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35    
) a 
CROSS JOIN 
(select	count(a11.row_key) AS opened_incidents
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
) b
union
select	'Incidents_pending_changes',count(distinct a11.row_key) AS pending_changes
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.change_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Incidents_Resolved_by_change',count(a11.row_key)*1.0 AS Resolved_by_change
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_incident_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a14.wh_dimension_code in ('RESOLVED', 'CLOSED')
 and a13.change_flag = 'Y'
 and a15.lagging_count_of_month between 0 and 35)
 union
  select	'Major_Incidents',count(a11.row_key) AS Major_Incidents
from	ldb.f_incident a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
where	a13.major_incident_flag='Y'
 and a12.lagging_count_of_month between 0 and 35
 union
 select	'Multiple_Assignment_Incidents',count(a11.row_key) AS Multiple_Assignment_Incident
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_assignment_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Multiple_Assignment_Incidents_Met_all_SLAs',count(a11.row_key) AS Multiple_Assignment_Incident_Met_all_SLAs
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_assignment_flag = 'Y'
 and a13.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Multiple_Assignment_Incidents_Missed_Any_SLAs',count(a11.row_key) AS Multiple_Assignment_Incident_Missed_Any_SLAs
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_assignment_flag = 'Y'
 and a13.met_sla_flag = 'N'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Multiple_categorization_on_incidents',count(a11.row_key) AS Multiple_categorization_incident
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_categorization_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35) 
 union
 SELECT 'Multiple_Categorization_on_Incidents_Percent',round(a.ABC/b.XYZ*100,0) as Multiple_Categorization_Incidents_Percent
FROM 
(SELECT count(a.row_key)*1.0 as ABC
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
where b.multiple_categorization_flag='Y'
and c.lagging_count_of_month between 0 and 35) a 
CROSS JOIN 
(SELECT count(a.row_key)*1.0 as XYZ
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
and c.lagging_count_of_month between 0 and 35) b 
union

SELECT 'Open_Incidents_Escalated',count(a.row_key) as Open_Incidents_Escalated
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 135
and b.priority_escalated_flag='Y'
union
select	'Opened_Incidents_overdue',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	  JOIN ldb.d_calendar_date a14 ON a11.opened_on_key=a14.row_key
where	(a12.over_due_flag = 'Y'
 and a13.wh_dimension_code = 'OPEN'and a14.lagging_count_of_month between 0 and 35)
 union
 select	'opened_incidents',count(a11.row_key) AS opened_incident
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
select	'Opened_Incidents-Last_30_days',count(a11.row_key) AS Opened_Incidents_Last_30_days
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	(a12.lagging_count_of_days between 0 and 29)
union
select	'Overdue_Incidents',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	  JOIN ldb.d_calendar_date a14 ON a11.opened_on_key=a14.row_key
where	(a12.over_due_flag = 'Y'
and a14.lagging_count_of_month between 0 and 35)
union
SELECT 'Overdue_incidents_Percent',round(a.ABC/b.XYZ*100,0) as Overdue_incident_Percent
FROM 
(select	count(a11.row_key) AS ABC
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	  JOIN ldb.d_calendar_date a14 ON a11.opened_on_key=a14.row_key
where	(a12.over_due_flag = 'Y'
and a14.lagging_count_of_month between 0 and 35)) a 
CROSS JOIN 
(SELECT count(a.row_key)*1.0 as XYZ
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
and c.lagging_count_of_month between 0 and 35) b 
union
SELECT 'persent_of_Incidents_Caused_by_change',round(a.ABC/b.XYZ*100,0) as Overdue_incident_Percent
FROM 
(select	count(a11.row_key) AS ABC
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.caused_by_change_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)) a 
CROSS JOIN 
(SELECT count(a.row_key)*1.0 as XYZ
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
and c.lagging_count_of_month between 0 and 35) b 
union
select	'Priority_escalated_incidents',count(a11.row_key) AS Priority_escalated_incidents
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.priority_escalated_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
select	'Reopened_Incidents',count(a11.row_key) AS Reopened_Incident
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 select	'Reopened_Incidents_Met_All_Slas',count(a11.row_key) AS Reopened_Incident_Met_All_Sla
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_flag = 'Y'
 and a13.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
  select	'Reopened_Incidents_Missed_Any_Sla',count(a11.row_key) AS Reopened_Incident_Missed_Any_Sla
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_flag = 'Y'
 and a13.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35)
 union
 SELECT 
'Resolve_time',(a.sum_open_to_resolve_duration/b.resolved_incidents)*1.0 as MTTR_Days
FROM 
(select	(sum((a11.open_to_resolve_duration / 86400.0)))*1.0 AS sum_open_to_resolve_duration
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_incident_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a14.wh_dimension_code in ('RESOLVED', 'CLOSED')
 and a15.lagging_count_of_month between 0 and 35)
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.0 AS resolved_incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
) b
union
select	'Resolve_Time_Business_Duration_Days',sum((a11.open_to_resolve_duration_c / 86400.0)) AS Resolved_Business_Duration_Days
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
select	'Resolved_Incidents',count(a11.row_key) AS Resolved_Incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
union
SELECT 
'resolved_incident_met_all_slas_percent',(a.resolved_incident_met_all_sla/b.resolved_incident)*100*1.0 as resolved_incident_met_all_sla_percentage
FROM 
(select	count(a11.row_key)*1.0 AS resolved_incident_met_all_sla
from	ldb.f_incident_resolved	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.last_resolved_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 35) 
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.0 AS resolved_incident
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 35
) b 
union
SELECT 'Resolved_Incidents_Missed_Any_SLAs',count(a.incident_key) AS Resolved_Incidents_Missed_Any_SLAs
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key 
WHERE b.met_sla_flag='N'
and d.lagging_count_of_month between 0 and 35
order by 1








