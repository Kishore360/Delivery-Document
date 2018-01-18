SELECT 'All Incidents',Count(a.row_key)
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 24
UNION
SELECT 'Auto Generated Incidents',Count(a.row_key)
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 24
AND b.auto_generated_flag='Y'
UNION 
select	'Avg_Age_Days',
	(sum((a24.age / 86400.0))/count(a24.row_key)) AS Avg_Age_Days
from	ldb.f_incident	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
select	'AvgofDaysSinceLastUpdateDays',sum(a24.dormancy_age)/count(a24.row_key)*1.0 AS AvgofDaysSinceLastUpdateDays
from	ldb.f_incident	a24
	join	ldb.d_incident	a12
	  on 	(a24.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a24.opened_on_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	(a13.wh_dimension_code = 'OPEN'
 and a15.lagging_count_of_month between 0 and 24)
UNION 
 select	'Avg_Open_To_Close_Duration_Days',sum((a24.open_to_close_duration / 86400.0))/count(a24.row_key) AS Avg_Incident_Open_To_Close_Duration_Days
from	ldb.f_incident_closed	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
select	'Closed_incidents',count(a24.row_key) AS Closed_incidents
from	ldb.f_incident_closed	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
SELECT 
'Closed_Incident_met_all_sla_percentage',
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
 and a14.lagging_count_of_month between 0 and 24) 
) a 
CROSS JOIN 
(select	count(a24.row_key) AS Closed_Incidents
from	ldb.f_incident_closed	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24   
) b
UNION
select	'Dormant_incidents',count(a24.row_key) AS Dormant_incidents
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
 UNION
 select	'Escalated_Incident_backlog',count(a24.row_key) AS Escalated_Incident_backlog
from	ldb.f_incident	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a24.incident_key = a13.row_key)
	join	ldb.d_incident_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a13.priority_escalated_flag = 'Y'
 and a14.wh_dimension_code = 'OPEN'
 and a15.lagging_count_of_month between 0 and 24)
 UNION 
 select	'First_call_resolution_incidents',count(a24.row_key) AS First_call_resolution_incidents
from	ldb.f_incident_resolved	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.last_resolved_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a24.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.first_call_resolution_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 UNION 
 select	'Incident backlog', count(a24.row_key) AS BacklogIncidents
from	ldb.f_incident	a24
	join	ldb.d_incident	a12
	  on 	(a24.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a24.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.backlog_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
UNION 
SELECT 'Incident Backlog Percentage', a.X/b.Y*100.0 
FROM 
(SELECT 	count(a24.row_key)*1.00 AS X
from	ldb.f_incident	a24
	join	ldb.d_incident	a12
	  on 	(a24.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a24.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.backlog_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24) ) a 
 CROSS JOIN 
 (
 SELECT 	count(a24.row_key)*1.00 AS Y
from	ldb.f_incident	a24
	join	ldb.d_incident	a12
	  on 	(a24.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a24.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a14.lagging_count_of_month between 0 and 24)
 ) b 
UNION 
select	'Incident_Priority_De_escalation_Count',sum(a11.priority_de_escalation_count) AS Incident_Priority_De_escalation_Count
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
select	'Incident_Priority_Escalation_Count',sum(a11.priority_escalation_count) AS Incident_Priority_Escalation_Count
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
select	'Incident_Caused_by_Change',count(a11.row_key) AS Incident_Caused_by_Change
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.change_flag='Y'
 and a14.lagging_count_of_month between 0 and 24)
 UNION 
 SELECT 'Incident_Caused_by_Change_Percentage', a.X/b.Y*100.00
 FROM 
 (
 select count(a11.row_key)*1.00 AS X
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.change_flag='Y'
 and a14.lagging_count_of_month between 0 and 24)
 ) a 
 CROSS JOIN 
 (
 select count(a11.row_key)*1.00 AS Y
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a14.lagging_count_of_month between 0 and 24)
 ) b 
UNION 
select	'Incident_Caused_by_Problem',count(a11.row_key) AS Incident_Caused_by_Problem
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.problem_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
UNION 
select 'Incident_Caused_by_Knowledge',count(a11.row_key)*1.00 AS Incident_Caused_by_Knowledge
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.knowledge_flag='Y'
 and a14.lagging_count_of_month between 0 and 24)
UNION 
SELECT 'Incident Fix Rate',
a.resolved_incidents/b.opened_incidents*1.0 as fix_rate
FROM 
(select	count(a11.row_key) AS resolved_incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11    
) a 
CROSS JOIN 
(select	count(a11.row_key) AS opened_incidents
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
) b
UNION 
select	'Incident_pending_changes',
count(distinct a11.row_key) AS pending_changes
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.change_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
UNION 
select	'Incident_Resolved_by_change',
count(a11.row_key)*1.0 AS Resolved_by_change
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_incident_state a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a14.wh_dimension_code in ('RESOLVED', 'CLOSED')
 and a13.change_flag = 'Y'
 and a15.lagging_count_of_month between 0 and 24)
 UNION 
 select	'Major_Incident',
count(distinct a11.row_key) AS Major_Incident
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.major_incident_flag='Y'
 and a14.lagging_count_of_month between 0 and 24)
UNION 

select 'MTTR_Days',
coalesce ((a.Sum_of_Open_to_Resolve_Duration)/(b.Resolved_Incidents)*0.1,0) from 
(
select	count(a11.row_key) AS Resolved_Incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24 
)b
cross join 
(select	sum((a11.open_to_resolve_duration / 86400.0)) AS Sum_of_Open_to_Resolve_Duration
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
 and a15.lagging_count_of_month between 0 and 24) 
 )a
 UNION
select	'Multiple_Assignment_Incidents',
count(distinct a11.row_key) AS Multiple_Assignment_Incidents
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_assignment_flag='Y'
 and a14.lagging_count_of_month between 0 and 24)
 UNION 
 
select	'Multiple_Assignment_Incident_Met_Any_SLAs',
count(a11.row_key) AS Multiple_Assignment_Incident_Met_Any_SLAs
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_assignment_flag = 'Y'
 and a13.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 UNION
 select	'Multiple_Assignment_Incident_Missed_Any_SLAs',
 count(a11.row_key) AS Multiple_Assignment_Incident_Missed_Any_SLAs
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_assignment_flag = 'Y'
 and a13.met_sla_flag = 'N'
 and a14.lagging_count_of_month between 0 and 24)
 UNION 
 select	'Multiple_categorization_incident',count(a11.row_key) AS Multiple_categorization_incident
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_categorization_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 UNION 
 SELECT 'Multiple_categorization_incident_Percentage',
(a.X/b.Y) *100.0 as Multiple_categorization_incident
FROM 
(select	count(a11.row_key)*1.00 AS X
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_categorization_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)  
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.00 AS Y
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
) b
UNION 
select	'opened_incident',
count(a11.row_key) AS opened_incident
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
select	'Opened_incident_last_30_days',
count(a11.row_key) AS Opened_incident_last_30_days
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
where	a12.lagging_count_of_days between 0 and 24
UNION 
select	'Overdue_incident_backlog',
count(a11.row_key) AS Overdue_incident_backlog
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_incident_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a13.over_due_flag = 'Y'
 and a14.wh_dimension_code = 'OPEN'
 and a15.lagging_count_of_month between 0 and 24)
 UNION 
 select	'Overdue_Incident',count(a11.row_key) AS Overdue_Incident
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.over_due_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 UNION 
SELECT 'Overdue_Incidents_Percent',a.ABC/b.XYZ*100 as Overdue_Incidents_Percent
FROM 
(SELECT count(a.row_key)*1.0 as ABC
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 24 
AND b.over_due_flag='Y')a
CROSS JOIN 
(SELECT count(a.row_key)*1.0 as XYZ
FROM ldb.f_incident  a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 24 ) b 
UNION 
select	'Priority_escalated_incidents',count(a11.row_key) AS Priority_escalated_incidents
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.priority_escalated_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 UNION 
 select	'Reassignment_Count',sum(a11.reassignment_count) AS Reassignment_Count
from	ldb.f_incident a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
select	'Reopened_incidents',count(a11.row_key) AS Reopened_incidents
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_flag='Y'
 and a14.lagging_count_of_month between 0 and 24)
 UNION 
 select	'Reopened_Count',sum(a11.reopened_count) AS Reopened_Count
from	ldb.f_incident a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
select	'Reopened_Incidents_Met_All_SLAs',count(a11.row_key) AS Reopened_Incidents_Met_All_SLAs
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_flag = 'Y'
 and a13.overall_sla_outcome_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 24)
 UNION 
 select	'Reopened_Incidents_Missed_Any_SLA',count(a11.row_key) AS Reopened_Incidents_Missed_Any_SLA
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_flag = 'Y'
 and a13.overall_sla_outcome_flag = 'N'
 and a14.lagging_count_of_month between 0 and 24)
 UNION 
 select	'Resolved_Incidents',count(a11.row_key) AS Resolved_Incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
UNION 
SELECT 'Resolved_Incidents_Missed_Any_SLAs',
count(a.incident_key) AS Resolved_Incidents_Missed_Any_SLAs
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key 
WHERE b.met_sla_flag='N'
and d.lagging_count_of_month between 0 and 24 

UNION 
SELECT 'resolved_incident_met_all_sla_percentage',
(a.X/b.Y)*100 as resolved_incident_met_all_sla_percentage
FROM 
(select	count(a11.row_key)*1.0 AS X
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
(select	count(a11.row_key)*1.0  AS Y
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 24
) b 
