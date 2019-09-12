--OPEN_TO_CLOSE_DURATION-MSTR showing wrong values --

SELECT 'All Incidents' as metrics,Count(a.row_key) as value
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 14
union
SELECT 'Auto Generated Incidents' as metrics,Count(a.row_key) as value
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 14
AND b.auto_generated_flag='Y'
UNION 
select	'Avg of Days Since Last Update'as metrics,sum(a24.dormancy_age)/count(a24.row_key)*1.0 AS value
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
 and a15.lagging_count_of_month between 0 and 14)
UNION 
select	'Avg of incidents age' as metrics,	(sum((a24.age / 86400.0))/count(a24.row_key)) AS value 
from	ldb.f_incident	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14

 union
  select	'Backlog Incidents' as metrics, count(a24.row_key) AS value
from	ldb.f_incident	a24
	join	ldb.d_incident	a12
	  on 	(a24.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a24.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.backlog_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 14)
union 

select	'Closed incidents' as metrics,count(a24.row_key) AS value
from	ldb.f_incident_closed	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14
UNION 
SELECT 
'Closed Incidents met all SLAs percent' as metrics,
(a.Closed_Incident_met_all_sla/b.Closed_Incidents)*100 as value
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
 and a14.lagging_count_of_month between 0 and 14) 
) a 
CROSS JOIN 
(select	count(a24.row_key)*1.0 AS Closed_Incidents
from	ldb.f_incident_closed	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14   
) b
union
SELECT 
'current open incidents'as metrics,b.current_open as value
FROM 
(select	count(a11.row_key) as current_open
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a11.opened_on_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a13.wh_dimension_code not in ('RESOLVED', 'CLOSED')
 and a15.lagging_count_of_month between 0 and 14) b

UNION
SELECT 'current open incidents percentage'as metrics,(a.current_open/b.opened_Incidents)*100 as value
FROM 
(select	count(a11.row_key) as current_open
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a11.opened_on_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a13.wh_dimension_code not in ('RESOLVED', 'CLOSED')
 and a15.lagging_count_of_month between 0 and 14) 
 a 
CROSS JOIN 
(select	count(a24.row_key)*1.0 AS opened_Incidents
from	ldb.f_incident	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14   
) b
UNION
select	'Dormant incidents' as metrics,count(a24.row_key) AS value
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
 and a15.lagging_count_of_month between 0 and 14)
 UNION
 select	'Duplicate Incidents' as metrics,count(a11.row_key)*1.0 AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.duplicate_incident_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 14)
 union
 select	'Email Sent'as metrics,sum(a11.email_sent_c) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14
 union
 select	'First call resolution incidents'as metrics,count(a24.row_key) AS value
from	ldb.f_incident_resolved	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.last_resolved_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a24.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.first_call_resolution_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 14)
 union
 select	'Incident Caused By Problem' as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.problem_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 14)
UNION 
 
select	'Incident Open To Close Duration(Hours)' as metrics,sum((a11.open_to_close_duration / 3600)) AS value
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14

union
select	'Incident Open To Resolve Duration (Hours)'as metrics,sum((a11.open_to_resolve_duration / 3600.0)) AS value
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
 and a15.lagging_count_of_month between 0 and 14)
 union
 select	'Incident Open To Resolve Duration (secs)'as metrics,sum((a11.open_to_resolve_duration)) AS value
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
 and a15.lagging_count_of_month between 0 and 14)
union
select	'Incident Reassignment Count'as metrics,COALESCE(sum(a11.reassignment_count), 0) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14
union

select	'Incident Reopened count'as metrics,sum(a11.reopened_count) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14

union

select	'Incidents Caused by Change' as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.caused_by_change_flag='Y'
 and a14.lagging_count_of_month between 0 and 14)
 UNION
 
select 'Incidents Causing Knowledge' as metrics,count(a11.row_key)*1.00 AS value
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.knowledge_flag='Y'
 and a14.lagging_count_of_month between 0 and 14)
 UNION
 select	'Incidents Closed As Duplicate' as metrics,count(a11.row_key)*1.0 AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.duplicate_incident_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 14)
 union
 select	'Incidents Closed with No Manual Intervention' as metrics,count(a11.row_key)*1.0 AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.closed_without_intervention_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 14)
 union
 SELECT 'Incidents closed without action'as metrics,a.closed_as_duplicate/b.closed_as_no_manual_intervension*1.0 as value
FROM 
(select	count(a11.row_key) AS closed_as_duplicate
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.duplicate_incident_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 14)   
) a 
CROSS JOIN 
(select	count(a11.row_key) AS closed_as_no_manual_intervension
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14
) b
 union
 SELECT 'Incident Fix Rate' as metrics,a.X/b.Y*100.00 as value
FROM 
(select	count(a11.row_key)*1.00 AS X
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14    
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.00 AS Y
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14
) b
UNION
select	'Incidents Pending Changes' as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.change_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 14)
UNION 
select	'Incidents Resolved By Change' as metrics,count(a11.row_key)*1.0 AS value
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
 and a15.lagging_count_of_month between 0 and 14)
 UNION
 select	'Major Incidents' as metrics,
count(distinct a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.major_incident_flag='Y'
 and a14.lagging_count_of_month between 0 and 14) 
union

select 'MTTR(Days)'as metrics,
coalesce ((a.Sum_of_Open_to_Resolve_Duration/86400.0)/(b.Resolved_Incidents))*1.0as value from 
(
select	count(a11.row_key)*1.0 AS Resolved_Incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14 
)b
cross join 
(select	sum((a11.open_to_resolve_duration ))*1.0 AS Sum_of_Open_to_Resolve_Duration
from	ldb.f_incident_resolved	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a11.last_resolved_on_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	(a13.wh_dimension_code in ('RESOLVED', 'CLOSED')
 and a15.lagging_count_of_month between 0 and 14
 ) 
 )a
union
select 'MTTR(Hours)'as metrics,
coalesce ((a.Sum_of_Open_to_Resolve_Duration/3600.0)/(b.Resolved_Incidents))*1.0as value from 
(
select	count(a11.row_key)*1.0 AS Resolved_Incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14 
)b
cross join 
(select	sum((a11.open_to_resolve_duration ))*1.0 AS Sum_of_Open_to_Resolve_Duration
from	ldb.f_incident_resolved	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a11.last_resolved_on_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	(a13.wh_dimension_code in ('RESOLVED', 'CLOSED')
 and a15.lagging_count_of_month between 0 and 14
 ) 
 )a
union
select	'MTTR Business Duration (Hours)'as metrics,sum((a11.sla_business_duration_c / 3600.0))/count(a11.row_key) AS value
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14

 UNION
 select	'Multiple Assignment Incidents' as metrics,
count(distinct a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_assignment_flag='Y'
 and a14.lagging_count_of_month between 0 and 14)
 
 UNION
 select	'Multiple Assignment Incidents Met All SLAs'as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_assignment_flag = 'Y'
 and a13.met_sla_flag = 'N'
 and a14.lagging_count_of_month between 0 and 14)
 union
 select	'Multiple Assignment Incidents Missed Any SLAs'as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_assignment_flag = 'Y'
 and a13.met_sla_flag = 'N'
 and a14.lagging_count_of_month between 0 and 14)
 union 
SELECT 'Open Incidents Escalated'as metrics,count(a.row_key) as value
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
join	ldb.d_incident_state	a13	  on 	(a.state_src_key = a13.row_key)
where  a13.wh_dimension_code not in ('RESOLVED', 'CLOSED') and d.lagging_count_of_month between 0 and 14 
and b.priority_escalated_flag='Y'
union 
SELECT 'Open Incidents overdue'as metrics,count(a.row_key) as value
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
join	ldb.d_incident_state	a13	  on 	(a.state_src_key = a13.row_key)
where  a13.wh_dimension_code not in ('RESOLVED', 'CLOSED') and d.lagging_count_of_month between 0 and 14 
and b.over_due_flag='Y'
union

 select	'Opened Incidents' as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	(a12.lagging_count_of_month between 0 and 14)
union
select	'Overdue Incidents'as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.over_due_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 14)
 UNION 
SELECT 'Overdue Incidents Percent' as metrics,a.ABC/b.XYZ*100 as value
FROM 
(SELECT count(a.row_key)*1.0 as ABC
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 14 
AND b.over_due_flag='Y')a
CROSS JOIN 
(SELECT count(a.row_key)*1.0 as XYZ
FROM ldb.f_incident  a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 14 ) b 
union
select	'P1 Downtime(Days)'as metrics,sum((a11.downtime_c / 86400.0)) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14
union
SELECT 'Percent of Incidents Caused by Change'as metrics,a.ABC/b.XYZ*100 as value
FROM 
(SELECT count(a.row_key)*1.0 as ABC
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
AND d.lagging_count_of_month between 0 and 14
where b.caused_by_change_flag='Y') a 
CROSS JOIN 
(SELECT count(a.row_key)*1.0 as XYZ
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 14) b 
union
select	'Priority Escalated Incidents' as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.priority_escalated_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 14)
 UNION
 select	'Reopened Incidents'as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_flag='Y'
 and a14.lagging_count_of_month between 0 and 14)
 UNION 
 select	'Reopened Incidents Met All SLAs'as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_flag = 'Y'
 and a13.met_sla_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 14)
 UNION 
 select	'Reopened Incidents Missed Any SLA'as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_flag = 'Y'
 and a13.met_sla_flag = 'N'
 and a14.lagging_count_of_month between 0 and 14)
 UNION
 select	'Resolved Incidents' as metrics,count(a11.row_key) AS value
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14
UNION

 SELECT 'Resolved Incident Met All SLA Percentage'as metrics,
(a.X/b.Y)*100 as value
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
 and a14.lagging_count_of_month between 0 and 14) 
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.0  AS Y
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 14
) b 

union
SELECT 'Resolved Incidents Missed Any SLAs'as metrics,
count(a.incident_key) AS value
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key 
WHERE b.met_sla_flag='N'
and d.lagging_count_of_month between 0 and 14

