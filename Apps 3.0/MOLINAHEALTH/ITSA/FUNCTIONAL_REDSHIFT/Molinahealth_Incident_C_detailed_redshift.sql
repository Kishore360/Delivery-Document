SELECT 'All Incidents',Count(a.row_key) as Metric_Value
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 24
UNION
SELECT 
'Avg of Days Since Last Update',
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
and a14.lagging_count_of_month between 0 and 24)a
CROSS JOIN
(select	count(a11.row_key) AS Y
from	ldb.f_incident	a11
join	ldb.d_incident	a12
on 	(a11.incident_key = a12.row_key)
JOIN    ldb.d_calendar_date a14
ON   a11.opened_on_key=a14.row_key
where	a12.backlog_flag = 'Y' 
and a14.lagging_count_of_month between 0 and 24)b
union
select	'Avg of Incidents Age (Days)',
(sum((a24.age / 86400.0))/count(a24.row_key)) AS Metric_Value
from	ldb.f_incident	a24
join	ldb.d_calendar_date	a12
on 	(a24.opened_on_key = a12.row_key)
join	ldb.d_calendar_month	a13
on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Backlog Incidents',count(a11.row_key) AS Metric_Value
from	ldb.f_incident	a11
join	ldb.d_incident	a12
on 	(a11.incident_key = a12.row_key)
join	ldb.d_calendar_date	a13
on 	(a11.opened_on_key = a13.row_key)
join	ldb.d_calendar_month	a14
on 	(a13.month_start_date_key = a14.row_key)
where	(a12.backlog_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
 select	'Closed Incidents',count(a24.row_key) AS Closed_incidents
from	ldb.f_incident_closed	a24
join	ldb.d_calendar_date	a12
on 	(a24.closed_on_key = a12.row_key)
join	ldb.d_calendar_month	a13
on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
SELECT 'Current Open Incidents Percent',round((a.X/b.Y)*100,0) AS metric_value
FROM  
(select	count(a11.row_key)*1.0 AS X
from	ldb.f_incident	a11
join	ldb.d_incident	a12
on 	(a11.incident_key = a12.row_key)
JOIN    ldb.d_calendar_date a14
ON   a11.opened_on_key=a14.row_key
where	a12.backlog_flag = 'Y' 
and a14.lagging_count_of_month between 0 and 24)a
CROSS JOIN
(select	count(a11.row_key)*1.0 AS Y
from	ldb.f_incident	a11
join	ldb.d_incident	a12
on 	(a11.incident_key = a12.row_key)
JOIN    ldb.d_calendar_date a14
ON   a11.opened_on_key=a14.row_key
where a14.lagging_count_of_month between 0 and 24)b
union
select	'Dormant Incidents',count(a24.row_key) AS metric_value
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
 and a15.lagging_count_of_month between 0 and 24)
 union
select	'First call resolution incidents',count(a11.row_key) AS First_call_resolution_incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.first_call_resolution_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
 select	'First Contact Resolution (FCR)',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident_resolved	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.last_resolved_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.first_point_of_contact_resolution_flag in ('Y')
 and a14.lagging_count_of_month between 0 and 24)
 union
 SELECT 'First Contact Resolution (FCR) Percentage',round((a.X/b.Y)*100.0,2) AS metric_value
FROM  
(select	count(a11.row_key)*1.0 AS X
from	ldb.f_incident_resolved	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.last_resolved_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.first_point_of_contact_resolution_flag in ('Y')
 and a14.lagging_count_of_month between 0 and 24))a
CROSS JOIN
(select	count(a11.row_key)*1.0 AS Y
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24)b
union
 select	'Incident Caused By Problem',count(a11.row_key) AS Incident_Caused_by_Problem
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.problem_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
 select	'Incident Open To Close Duration (Days)',round(sum((a11.open_to_close_duration / 86400.0)),2) AS WJXBFS1
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Incident Reassignment Count',COALESCE(sum(a11.reassignment_count), 0) AS Incident_Reassignment_Count
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Incident Reopened Count',sum(a11.reopened_count) AS Incident_reopened_count
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Incident Sev 1 Count',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident_resolved	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.last_resolved_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.sev1_incident_flag_c in ('Y')
 and a14.lagging_count_of_month between 0 and 24)
union
 select	'Incidents caused By change',count(a11.row_key) AS Caused_by_change
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.caused_by_change_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
union
select	'Incidents causing Knowledge',count(a11.row_key) AS causing_knowledge
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.knowledge_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
 SELECT 
'Incidents Fix Rate',round(a.abc/b.xyz*100.0,0) as fix_rate
FROM 
(select	count(a11.row_key)*1.0 AS abc
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24    
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.0 AS xyz
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24 
) b
union
select	'Incidents Pending Change',count(distinct a11.row_key) AS pending_changes
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.change_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
 select	'Incidents Resolved By Change',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a11.opened_on_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	(a13.wh_dimension_code in ('RESOLVED', 'CLOSED')
 and a12.change_flag = 'Y'
 and a15.lagging_count_of_month between 0 and 24)
 union
  select	'Major Incidents',count(a11.row_key) AS Major_Incidents
from	ldb.f_incident a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
where	a13.major_incident_flag='Y'
 and a12.lagging_count_of_month between 0 and 24
 union
 select 'MTTR(in hours)',round(sum((a11.open_to_resolve_duration / 3600.0)) /count(a11.row_key),1)
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
 select	'Multiple Assignment Incidents',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.multiple_assignment_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
 select	'Multiple Assignment Incidents Met All SLAs',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.multiple_assignment_flag = 'Y'
 and a12.incident_met_resolution_sla_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
 select	'Multiple Assignment Incidents Missed Any SLA',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.multiple_assignment_flag = 'Y'
 and a12.incident_met_resolution_sla_c_flag = 'N'
 and a14.lagging_count_of_month between 0 and 24)
 union
 select	'Multiple Categorization Incidents',count(a11.row_key) AS Multiple_categorization_incident
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_categorization_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
 select	'Number of Impacted Users',sum(a11.number_of_impacted_users_c) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
SELECT 'Open Incidents Escalated',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a11.opened_on_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	(a12.priority_escalated_flag = 'Y'
 and a13.wh_dimension_code = 'OPEN'
 and a15.lagging_count_of_month between 0 and 24)
union
select	'Open Incidents Overdue',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	  JOIN ldb.d_calendar_date a14 ON a11.opened_on_key=a14.row_key
where	(a12.over_due_flag = 'Y'
 and a13.wh_dimension_code = 'OPEN'and a14.lagging_count_of_month between 0 and 24)
 union
 select	'Opened Incidents',count(a11.row_key) AS opened_incident
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Outage Duration',sum(a11.outage_duration) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
select	'Overdue Incidents',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.over_due_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
SELECT 'Overdue Incidents Percent',round(a.ABC/b.XYZ*100,0) as Overdue_incident_Percent
FROM 
(select	count(a11.row_key) AS ABC
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	  JOIN ldb.d_calendar_date a14 ON a11.opened_on_key=a14.row_key
where	(a12.over_due_flag = 'Y'
and a14.lagging_count_of_month between 0 and 24)) a 
CROSS JOIN 
(SELECT count(a.row_key)*1.0 as XYZ
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
and c.lagging_count_of_month between 0 and 24) b 
union
SELECT 'Percent of Incidents Caused By Change',round(a.ABC/b.XYZ*100,2) as Overdue_incident_Percent
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
 and a14.lagging_count_of_month between 0 and 24)) a 
CROSS JOIN 
(SELECT count(a.row_key)*1.0 as XYZ
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
and c.lagging_count_of_month between 0 and 24) b 
union
select	'Priority Escalated Incidents',count(a11.row_key) AS Priority_escalated_incidents
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.priority_escalated_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
select	'Reopened Incidents',count(a11.row_key) AS Reopened_Incident
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
 select	'Reopened Incidents Met All SLAs',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.reopened_flag = 'Y'
 and a12.incident_met_resolution_sla_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 union
  select	'Reopened Incidents Missed Any SLA',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.reopened_flag = 'Y'
 and a12.incident_met_resolution_sla_c_flag = 'N'
 and a14.lagging_count_of_month between 0 and 24)
 union
select	'Resolved Incidents',count(a11.row_key) AS Resolved_Incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
union
SELECT 
'Resolved Incidents Met All Resolution SLAs Percent',round((a.abc/b.xyz)*100,0) as MTTR_Days
FROM 
(select	count(a11.row_key)*1.0 AS abc
from	ldb.f_incident_resolved	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.last_resolved_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.incident_met_resolution_sla_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24) 
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.0 AS xyz
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24)b
union
select	'Resolved Incidents Met All SLAs',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident_resolved	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.last_resolved_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.incident_met_resolution_sla_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
union
SELECT 
'Resolved Incidents Met All SLAs Percent',round((a.abc/b.xyz)*100,0) as MTTR_Days
FROM 
(select	count(a11.row_key) AS abc
from	ldb.f_incident_resolved	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.last_resolved_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)  
) a 
CROSS JOIN 
(select	count(a11.row_key) AS xyz
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24)b
union
select	'Resolved Incidents Missed Any SLA',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident_resolved	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.last_resolved_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.incident_met_resolution_sla_c_flag = 'N'
 and a14.lagging_count_of_month between 0 and 24)
 order by 1