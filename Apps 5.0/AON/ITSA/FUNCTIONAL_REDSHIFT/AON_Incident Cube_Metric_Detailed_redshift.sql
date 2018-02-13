SELECT 'All Incidents',Count(a.row_key)
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 26

UNION
SELECT 'Auto Generated Incidents',Count(a.row_key)
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 26
AND b.auto_generated_flag='Y'
UNION 
select	'Avg_Age_Days',
	(sum((a26.age / 86400.0))/count(a26.row_key)) AS Avg_Age_Days
from	ldb.f_incident	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 26
UNION
select 'Avg Count of User Escalations',a.x/b.y from  (SELECT sum(a.u_status_update_count_c) as x
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 26
) a cross join (
SELECT count(a.row_key) as y
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 26 and (b.u_status_update_count_c >=  1
 and b.u_major_c = 'N'))b
UNION
select	'Avg  Days Since Last Update ',
(sum(a26.dormancy_age)/86400.0)/count(a26.row_key)*1.0 AS AvgofDaysSinceLastUpdateDays
from	ldb.f_incident	a26
	join	ldb.d_incident	a12
	  on 	(a26.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a26.opened_on_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	(a13.wh_dimension_code = 'OPEN'
 and a15.lagging_count_of_month between 0 and 26)
UNION 
 select	'Avg Open To Close Duration Days',sum((a26.open_to_close_duration / 86400.0))/count(a26.row_key) AS Avg_Incident_Open_To_Close_Duration_Days
from	ldb.f_incident_closed	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 26
UNION 
select	'Closed Incidents',count(a26.row_key) AS Closed_incidents
from	ldb.f_incident_closed	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 26
UNION 
SELECT 
'Closed Incident met all sla percentage',
(a.x/b.y)*100 
FROM 
(select	cast(count(a26.row_key) AS  decimal) as x
from	ldb.f_incident_closed	a26
	join	ldb.d_incident	a12
	  on 	(a26.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a26.closed_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.overall_sla_outcome_flag = 'Y'  
 and a14.lagging_count_of_month between 0 and 26) 
) a 
CROSS JOIN 
(select	cast(count(a26.row_key) AS decimal) as y
from	ldb.f_incident_closed	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.closed_on_key = a12.row_key)
	where	a12.lagging_count_of_month between 0 and 26   
) b
UNION
select	'Detection Duration',sum(a26.detection_duration_c)/3600.0 AS Dormant_incidents
from	ldb.f_incident	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a26.incident_key = a13.row_key)
	join	ldb.d_incident_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	( a15.lagging_count_of_month between 0 and 26)
UNION

select	'Detection Duration',
ceiling(sum(a26.recovery_duration_c)/3600.0) AS Dormant_incidents
from	ldb.f_incident	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a26.incident_key = a13.row_key)
	join	ldb.d_incident_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	( a15.lagging_count_of_month between 0 and 26) 
 UNION



select	'Diagnosis Duration',sum(a26.diagnosis_duration_c)/3600.0 AS Dormant_incidents
from	ldb.f_incident	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a26.incident_key = a13.row_key)
		join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	( a15.lagging_count_of_month between 0 and 26)

UNION
select	'Dormant Incidents',count(a26.row_key) AS Dormant_incidents
from	ldb.f_incident	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a26.incident_key = a13.row_key)
	join	ldb.d_incident_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a13.dormant_flag = 'Y'
 and a14.wh_dimension_code = 'OPEN'
 and a15.lagging_count_of_month between 0 and 26)
 UNION
 select	'Escalated_Incident_backlog',count(a26.row_key) AS Escalated_Incident_backlog
from	ldb.f_incident	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a26.incident_key = a13.row_key)
	join	ldb.d_incident_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a13.priority_escalated_flag = 'Y'
 and a14.wh_dimension_code = 'OPEN'
 and a15.lagging_count_of_month between 0 and 26)
 UNION 
 select	'First_call_resolution_incidents',count(a26.row_key) AS First_call_resolution_incidents
from	ldb.f_incident_resolved	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.last_resolved_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a26.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.u_first_call_resolution_c = 'Y'
 and a14.lagging_count_of_month between 0 and 26)
 UNION 
 select	'Incident backlog', count(a26.row_key) AS BacklogIncidents
from	ldb.f_incident	a26
	join	ldb.d_incident	a12
	  on 	(a26.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a26.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.backlog_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 26)
UNION 
SELECT 'Incident Backlog Percentage',ceiling( a.X/b.Y*100.0) 
FROM 
(SELECT 	count(a26.row_key)*1.00 AS X
from	ldb.f_incident	a26
	join	ldb.d_incident	a12
	  on 	(a26.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a26.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.backlog_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 26) ) a 
 CROSS JOIN 
 (
 SELECT 	count(a26.row_key)*1.00 AS Y
from	ldb.f_incident	a26
	join	ldb.d_incident	a12
	  on 	(a26.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a26.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a14.lagging_count_of_month between 0 and 26)
 ) b 
 
UNION


select	'Employees per assignment group',sum(a14.emp_count) AS Employees_per_assignment_group
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_internal_organization_group	a14
	  on 	(a11.assignment_group_key = a14.row_key)
where	( a13.lagging_count_of_month between 0 and 26)

UNION




select	'Incident Volume',count(a11.row_key) AS Incident_Volume
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_internal_organization_group	a14
	  on 	(a11.assignment_group_key = a14.row_key)
where	( a11.parent_incident_key=0 and a13.lagging_count_of_month between 0 and 26)








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
 and a14.lagging_count_of_month between 0 and 26)
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
 and a14.lagging_count_of_month between 0 and 26)
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
where	(a14.lagging_count_of_month between 0 and 26)
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
 and a14.lagging_count_of_month between 0 and 26)
UNION 
select 'Incident_Causing_Knowledge',count(a11.row_key)*1.00 AS Incident_Caused_by_Knowledge
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.knowledge_flag='Y'
 and a14.lagging_count_of_month between 0 and 26)
UNION 
SELECT 'Incident Fix Rate',
a.resolved_incidents/b.opened_incidents*1.0 as fix_rate
FROM 
(select	cast(count(a11.row_key)as decimal) AS resolved_incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11    
) a 
CROSS JOIN 
(select	cast(count(a11.row_key)as decimal) AS opened_incidents
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 26
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
 and a14.lagging_count_of_month between 0 and 26)
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
 and a15.lagging_count_of_month between 0 and 26)
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
 and a14.lagging_count_of_month between 0 and 26)
UNION 

select 'MTTR Days',a.Sum_of_Open_to_Resolve_Duration/(b.Resolved_Incidents)*1.0 from 
(select	cast(count(a11.row_key) as decimal) AS Resolved_Incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 26 )b
cross join 
(select	sum(a11.open_to_resolve_duration/ 86400.0) AS Sum_of_Open_to_Resolve_Duration
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
 and a15.lagging_count_of_month between 0 and 26)  )a
 UNION
 
 select 'MTTR hours',a.Sum_of_Open_to_Resolve_Duration/(b.Resolved_Incidents)*1.0 from 
(select	cast(count(a11.row_key) as decimal) AS Resolved_Incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 26 )b
cross join 
(select	sum(a11.open_to_resolve_duration/ 3600.0) AS Sum_of_Open_to_Resolve_Duration
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
 and a15.lagging_count_of_month between 0 and 26)  )a
 
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
 and a14.lagging_count_of_month between 0 and 26)
 UNION 
 
select	'Multiple_Assignment_Incident_Met_All_SLAs',
count(a11.row_key) AS Multiple_Assignment_Incident_Met_Any_SLAs
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_assignment_flag = 'Y'
 and a13.overall_sla_outcome_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 26)
 UNION
 select	'Multiple_Assignment_Incident_Missed_Any_SLA',
 count(a11.row_key) AS Multiple_Assignment_Incident_Missed_Any_SLAs
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_assignment_flag = 'Y'
 and a13.overall_sla_outcome_flag = 'N'
 and a14.lagging_count_of_month between 0 and 26)
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
 and a14.lagging_count_of_month between 0 and 26)
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
 and a14.lagging_count_of_month between 0 and 26)  
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.00 AS Y
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 26
) b
UNION 
select	'opened_incident',
count(a11.row_key) AS opened_incident
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 26
UNION 
select	'Opened_incident_last_30_days',
count(a11.row_key) AS Opened_incident_last_30_days
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
where	a12.lagging_count_of_days between 0 and 26
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
 and a15.lagging_count_of_month between 0 and 26)
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
 and a14.lagging_count_of_month between 0 and 26)
 UNION 
SELECT 'Overdue_Incidents_Percent',a.ABC/b.XYZ*100 as Overdue_Incidents_Percent
FROM 
(SELECT count(a.row_key)*1.0 as ABC
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 26 
AND b.over_due_flag='Y')a
CROSS JOIN 
(SELECT count(a.row_key)*1.0 as XYZ
FROM ldb.f_incident  a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 26 ) b 
UNION 
select	'Priority_escalated_incidents',
count(a11.row_key) AS Priority_escalated_incidents
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.priority_escalated_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 26)
 UNION 
 select	'Reassignment_Count',sum(a11.reassignment_count) AS Reassignment_Count
from	ldb.f_incident a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 26
UNION 







 select	'Reopened_Count',sum(a11.reopened_count) AS Reopened_Count
from	ldb.f_incident a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 26
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
 and a14.lagging_count_of_month between 0 and 26)
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
 and a14.lagging_count_of_month between 0 and 26)
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
 and a14.lagging_count_of_month between 0 and 26)
 UNION 
 select	'Resolved_Incidents',count(a11.row_key) AS Resolved_Incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 26
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
where	(a12.overall_sla_outcome_flag  = 'Y'
 and a14.lagging_count_of_month between 0 and 26) 
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.0  AS Y
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 26
) b 

UNION


select	'Resolution SLA Met',count(a26.row_key) AS Resolution_SLA_Met
from	ldb.f_incident	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a26.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.met_resolution_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 26)
 
 
 UNION

select	'Response SLA Met',count(a26.row_key) AS Resolution_SLA_Met
from	ldb.f_incident	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a26.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.met_response_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 26)
UNION
select	'Response Time (Hours)',
sum(a26.response_duration_c)/3600.0 AS Response_Time
from	ldb.f_incident	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a26.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	( a14.lagging_count_of_month between 0 and 26)
UNION
select	'Status Update Count',
sum(a26.u_status_update_count_c) AS status_update_count
from	ldb.f_incident	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a26.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	( a14.lagging_count_of_month between 0 and 26)
UNION
select	'Time To Restore',
ceiling(sum(a26.tracc_duration_c)/3600.0) AS Time_to_restore
from	ldb.f_incident	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a26.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	( a14.lagging_count_of_month between 0 and 26)
UNION
select	'Response SLA Met',count(a26.row_key) AS Resolution_SLA_Met
from	ldb.f_incident	a26
	join	ldb.d_calendar_date	a12
	  on 	(a26.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a26.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.met_response_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 26)
UNION
SELECT 'Resolved_Incidents_Missed_Any_SLAs',
count(a.incident_key) AS Resolved_Incidents_Missed_Any_SLAs
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key 
WHERE b.overall_sla_outcome_flag ='N'
and d.lagging_count_of_month between 0 and 26
UNION
select	'Tickets Submitted',count(a.incident_key) AS WJXBFS1
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key 
where	b.tickets_submitted_by_c_flag = 'Y' and d.lagging_count_of_month between 0 and 26
UNION
select 'User Esclated Incidents %',a.x/b.y*100 from  (
select	cast(count(a11.row_key) as decimal) AS x
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	  JOIN ldb.d_calendar_date c ON a11.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where	(a12.u_status_update_count_c >=  1
 and a12.u_major_c = 'N') 
and d.lagging_count_of_month between 0 and 26
) a cross join (
SELECT cast(count(a.row_key) as decimal) as y
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
join	ldb.d_incident_state	a13
	  on 	(a.state_src_key = a13.row_key)
where	(a13.wh_dimension_code = 'OPEN'
 or a13.wh_dimension_code in ('RESOLVED', 'CLOSED'))
and d.lagging_count_of_month between 0 and 26 )b 

