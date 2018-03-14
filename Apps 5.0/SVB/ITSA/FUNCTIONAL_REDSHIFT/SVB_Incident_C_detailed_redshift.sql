SELECT 
'% of Closed Incident Assignments Acknowledge Within Service Level Target',
(a.X/b.Y)*100.0 AS Metric_Value
FROM  
(select	count(a11.row_key)*1.0 AS X
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.has_breached_ack_c_flag = 'N'
 and a14.lagging_count_of_month between 0 and 12) )a
CROSS JOIN
(select	count(a11.row_key)*1.0 AS Y
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12 )b
union
SELECT 
'% of Incidents Resolved within the Service Level Target',
(a.X/b.Y)*100.0 AS Metric_Value fROM  
(select	count(a11.row_key)*1.0 AS X
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
	join	ldb.d_incident_close_code_c	a15
	  on 	(a11.close_code_src_key = a15.row_key)
where	(a13.resolved_flag_c = 'Y'
 and a15.source_dimension_name not in ('Cancelled - Not an Incident')
 and a14.lagging_count_of_month between 0 and 12)  )a
CROSS JOIN
(select	count(a11.row_key)*1.0 AS Y
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12 )b
union
SELECT 
'% Of Times My Assignment Group Met The Time-To-Update SLA',
(a.X/b.Y)*100.0 AS Metric_Value fROM  
(select	count(a11.row_key)*1.0 AS X
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
	join	ldb.d_incident_state	a15
	  on 	(a13.state_src_key = a15.row_key)
where	(a15.source_dimension_name not in ('Closed', 'Resolved')
 and a13.has_breached_update_c_flag = 'N'
 and a14.lagging_count_of_month between 0 and 12)  )a
CROSS JOIN
(select	count(a11.row_key) AS Y
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12 
)b
union
select	'Acknowleged (Min)',sum((a11.open_to_acknowledge_duration_c / 60.0))/count(a11.row_key) 
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
SELECT 'All Incidents',Count(a.row_key) as Metric_Value
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 12
UNION
select	'Avg Incidents Age (Days)',sum((a11.age / 86400.0))/count(a11.row_key) 
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
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
and a14.lagging_count_of_month between 0 and 12)a
CROSS JOIN
(select	count(a11.row_key) AS Y
from	ldb.f_incident	a11
join	ldb.d_incident	a12
on 	(a11.incident_key = a12.row_key)
JOIN    ldb.d_calendar_date a14
ON   a11.opened_on_key=a14.row_key
where	a12.backlog_flag = 'Y' 
and a14.lagging_count_of_month between 0 and 12)b
union
select	'Avg. Time Between Open and Set as P1 (hours)',sum((a11.total_time_c / 3600.0)) /count(a11.row_key) 
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
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
 and a14.lagging_count_of_month between 0 and 12)
 union
 select	'Business Duration',sum(a11.business_duration_c) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Business Elapsed Acknowledgement Time',sum(a11.business_duration_ack_c) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Business Elapsed Resolution Time',sum(a11.business_duration_resolution_c) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Carried Over Incidents',sum(a11.carried_over_count_c) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
 select	'Closed Incidents',count(a24.row_key) AS Closed_incidents
from	ldb.f_incident_closed	a24
join	ldb.d_calendar_date	a12
on 	(a24.closed_on_key = a12.row_key)
join	ldb.d_calendar_month	a13
on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
SELECT 
'Closed_Incidents_met_all_sla_percentage',
(a.Closed_Incident_met_all_sla/b.Closed_Incidents)*100 as Closed_Incident_met_all_sla_percentage
FROM 
(select	count(a24.row_key)*1.0 AS Closed_Incident_met_all_sla
from	ldb.f_incident_closed	a24
join	ldb.d_incident	a12
on 	(a24.incident_key = a12.row_key)
join	ldb.d_calendar_date	a13
on 	(a24.closed_on_key = a13.row_key)
join	ldb.d_calendar_month	a14
on 	(a13.month_start_date_key = a14.row_key)
where	(a12.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 12) 
) a 
CROSS JOIN 
(select	count(a24.row_key)*1.0 AS Closed_Incidents
from	ldb.f_incident_closed	a24
join	ldb.d_calendar_date	a12
on 	(a24.closed_on_key = a12.row_key)
join	ldb.d_calendar_month	a13
on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12 
) b
union
select	'Count of Reasons for Time-to-Resolve Breach',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reason_for_resolve_breach_c is not null
 and a14.lagging_count_of_month between 0 and 12)
 union
 select	'Count Times My Assignment Group Met The Time-To-Update SLA',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
	join	ldb.d_incident_state	a15
	  on 	(a13.state_src_key = a15.row_key)
where	(a15.source_dimension_name not in ('Closed', 'Resolved')
 and a13.has_breached_update_c_flag = 'N'
 and a14.lagging_count_of_month between 0 and 12)
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
 and a15.lagging_count_of_month between 0 and 12)
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
 and a15.lagging_count_of_month between 0 and 12)
 union
 select	'Duplicate Incidents',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.duplicate_incident_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 12)
 union
 select	'Escalated Incident Backlog',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_incident_state	a14
	  on 	(a13.state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a13.priority_escalated_flag = 'Y'
 and a14.wh_dimension_code = 'OPEN'
 and a15.lagging_count_of_month between 0 and 12)
 union
 select	'Hrs Resolved',sum((a11.open_to_resolve_duration / 3600.0)) AS WJXBFS1
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
SELECT 
'Incident Backlog %',
(a.X/b.Y)*100.0 AS Metric_Value fROM  
(select	count(a11.row_key)1.0 AS X
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.backlog_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 12)  )a
CROSS JOIN
(select	count(a11.row_key)*1.0 AS Y
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12 
)b
union
select	'Incident Open To Close Duration',sum((a11.open_to_close_duration / 3600.0)) AS WJXBFS1
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Incident Open To Resolve Duration',sum(a11.open_to_resolve_duration) AS WJXBFS1
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Incident Reassignment Count',COALESCE(sum(a11.reassignment_count), 0) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Incident Reopened Count',sum(a11.reopened_count) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
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
 and a14.lagging_count_of_month between 0 and 12)
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
 and a14.lagging_count_of_month between 0 and 12)
 union
 SELECT 
'Incidents_fix_rates',(a.resolved_incidents/b.opened_incidents)*100.0 as fix_rate
FROM 
(select	count(a11.row_key) AS resolved_incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12    
) a 
CROSS JOIN 
(select	count(a11.row_key) AS opened_incidents
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
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
 and a14.lagging_count_of_month between 0 and 12)
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
 and a15.lagging_count_of_month between 0 and 12)
 union
  select	'Major_Incidents',count(a11.row_key) AS Major_Incidents
from	ldb.f_incident a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
where	a13.major_incident_flag='Y'
 and a12.lagging_count_of_month between 0 and 12
 union
 select	'Mean Acknowledgement duration of incidents for  Acknowledge SLAs Actual elapsed time',sum(a11.duration_ack_c) /count(a11.row_key) 
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Mean Acknowledgement duration of incidents for  Acknowledge SLAs Business elapsed time',sum(a11.business_duration_ack_c) /count(a11.row_key) 
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Mean resolution duration of incidents for  Resolution SLAs Actual elapsed time',sum(a11.duration_resolution_c) /count(a11.row_key)
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Mean Resolution duration of incidents for  Resolution SLAs Business elapsed time',sum(a11.business_duration_resolution_c) /count(a11.row_key) 
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'MI',count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
	join	ldb.d_incident_priority	a15
	  on 	(a13.priority_src_key = a15.row_key)
where	((a13.major_incident_flag in ('Y')
 or a13.set_to_p1_c is not null)
 and a15.source_dimension_code = '1'
 and a14.lagging_count_of_month between 0 and 12)
 union
 SELECT 
'MTTR (days)',a.abc/b.xyz*1.0 as fix_rate
FROM 
(select	sum((a11.open_to_resolve_duration / 86400.0))*1.0 AS abc
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
 and a15.lagging_count_of_month between 0 and 12) 
  
) a 
CROSS JOIN 
(select	count(a11.row_key) AS xyz
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12 
) b
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
 and a14.lagging_count_of_month between 0 and 12)
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
 and a14.lagging_count_of_month between 0 and 12)
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
 and a14.lagging_count_of_month between 0 and 12)
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
 and a14.lagging_count_of_month between 0 and 12) 
 union
 SELECT 'Multiple_Categorization_on_Incidents_Percent',round(a.ABC/b.XYZ*100,0) as Multiple_Categorization_Incidents_Percent
FROM 
(SELECT count(a.row_key)*1.0 as ABC
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
where b.multiple_categorization_flag='Y'
and c.lagging_count_of_month between 0 and 12) a 
CROSS JOIN 
(SELECT count(a.row_key)*1.0 as XYZ
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
and c.lagging_count_of_month between 0 and 12) b
union
select	'Opened Incidents',count(a11.row_key) 
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Priority Count',sum(a11.priority_count_c) AS Priority_Count_C
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
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
 and a14.lagging_count_of_month between 0 and 12)
 union
 select	'Referral Count',sum(a11.referral_count_c) AS Referral_Count_C
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
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
 and a14.lagging_count_of_month between 0 and 12)
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
 and a14.lagging_count_of_month between 0 and 12)
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
 and a14.lagging_count_of_month between 0 and 12)
 union
 select	'Resolution Time (sec)',sum(a11.resolution_time_c) AS WJXBFS1
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Resolve Time (sec)',sum(a11.calendar_stc_c) AS WJXBFS1
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Resolved_Incidents',count(a11.row_key) AS Resolved_Incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
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
 and a14.lagging_count_of_month between 0 and 12) 
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.0 AS resolved_incident
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
) b 
union
SELECT 'Resolved_Incidents_Missed_Any_SLAs',count(a.incident_key) AS Resolved_Incidents_Missed_Any_SLAs
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key 
WHERE b.met_sla_flag='N'
and d.lagging_count_of_month between 0 and 12
union
select	'Time Worked (Sec)',sum(a11.time_worked) AS WJXBFS1
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Total Time Between Open and Set as P1 (hours)',sum((a11.total_time_c / 3600.0)) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
order by 1