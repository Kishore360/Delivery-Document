-- AVG OF INCIDENT AGE(DAYS) - Query correct but web is not divided by 86400
-- MTTR: fact should come from resolved and not open
SELECT '% Opened Incidents Last To Last 30 Days' as metrics,
((b.opened_incidents_last_30_days-a.opened_incidents_last_to_last_30_days)/a.opened_incidents_last_to_last_30_days)*100*1.0 as value
FROM 
(select	count(a11.row_key)*1.0 AS opened_incidents_last_to_last_30_days
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
where	a12.lagging_count_of_days between 30 and 59 
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.0 AS opened_incidents_last_30_days
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a12.lagging_count_of_days between 0 and 29

) b 
union

SELECT '% priority escalated Incidents Last To Last 30 Days' as metrics,
((b.priority_escalated_incidents_last_30_days-a.priority_escalated_incidents_last_to_last_30_days)/a.priority_escalated_incidents_last_to_last_30_days)*100*1.0 as value
FROM 
(select	count(a11.row_key)*1.0 AS priority_escalated_incidents_last_to_last_30_days
from	ldb.f_incident	a11
join ldb.d_incident d on a11.incident_key=d.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
where priority_escalated_flag='Y' and 	a12.lagging_count_of_days between 30 and 59 
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.0 AS priority_escalated_incidents_last_30_days
from	ldb.f_incident	a11
join ldb.d_incident d on a11.incident_key=d.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where priority_escalated_flag='Y' and	a12.lagging_count_of_days between 0 and 29

) b 
union

SELECT '% reopened Incidents Last To Last 30 Days' as metrics,
((b.reopened_incidents_last_30_days-a.reopened_incidents_last_to_last_30_days)/a.reopened_incidents_last_to_last_30_days)*100*1.0 as value
FROM 
(select	count(a11.row_key)*1.0 AS reopened_incidents_last_to_last_30_days
from	ldb.f_incident	a11
join ldb.d_incident d on a11.incident_key=d.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
where reopened_flag='Y' and 	a12.lagging_count_of_days between 30 and 59 
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.0 AS reopened_incidents_last_30_days
from	ldb.f_incident	a11
join ldb.d_incident d on a11.incident_key=d.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where reopened_flag='Y' and 	a12.lagging_count_of_days between 0 and 29

) b 


union

select	'Actual Elapsed Time SLA No Pause Hrs' as metrics,sum((a11.resolution_without_pause_sla_duration_c / 3600.0)) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union

select  'Actual Elapsed Time - SLA with Pause(Hrs)'as metrics,( sum(a.resolution_with_pause_sla_duration_c/3600.00) ) AS value
from ldb.f_incident a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 12
union
select	'Actual Elapsed Time Response SLA (Hrs)'as metrics,sum((a11.response_sla_duration_c / 3600.0)) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
SELECT 'All Incidents' as metrics,Count(a.row_key) as value
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 12
union
select 'All Incidents Met Resolution SLA No Pause' as metrics,	count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.met_resolution_without_pause_sla_c_flag = 'Y')

union

select	'All Incidents Met Resolution SLA with Pause'as metrics,count(a11.row_key)  AS value
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.met_resolution_with_pause_sla_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 12)
 
 union
 
 
 select	'All Incidents Missed Resolution SLA No Pause'as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.met_resolution_without_pause_sla_c_flag = 'N'
 and a14.lagging_count_of_month between 0 and 12)
 
 union
 
 select	'All Incidents Met Resolution SLA with Pause'as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.met_resolution_with_pause_sla_c_flag = 'N'
 and a14.lagging_count_of_month between 0 and 12)
 
 union
 
 
select	'Applied Effort (Hrs)'as metrics,(sum(a11.hours_minutes_c) / 3600.0) AS value
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
UNION
SELECT 'Auto Generated Incidents' as metrics,Count(a.row_key) as value
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 12
AND b.auto_generated_flag='Y'
UNION 
select	'Avg of Days Since Last Update (Days)'as metrics,sum(a24.dormancy_age)/count(a24.row_key)*1.0 AS value
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
 and a15.lagging_count_of_month between 0 and 12)
UNION 
select	'Avg Age (Days)' as metrics,	(sum((a24.age / 86400.0))/count(a24.row_key)) AS value -- (***Data not matching)
from	ldb.f_incident	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12

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
 and a14.lagging_count_of_month between 0 and 12)
union 
 
select	'Business Elapsed Time Resolution SLA No Pause(Hrs)'as metrics,sum((a11.business_elapsed_resolution_without_pause_sla_duration_c / 3600.0)) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12

union

select	'Business Elapsed Time Resolution SLA With Pause (Hrs)'as metrics,sum((a11.business_elapsed_resolution_with_pause_sla_duration_c / 3600.0)) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12

union
select	'Business Elapsed Time Response SLA (Hrs)'as metrics,sum((a11.business_elapsed_response_sla_duration_c / 3600.0)) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12

union


select	'Business Impact (Mins)'as metrics,sum(a11.minutes_of_business_impact_c) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12

union


select	'Closed incidents' as metrics,count(a24.row_key) AS value
from	ldb.f_incident_closed	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
UNION 
SELECT 
'Closed Incident met all sla percentage' as metrics,
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

SELECT 
'current open incidents percentage'as metrics,(a.current_open/b.opened_Incidents)*100 as value
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
 and a15.lagging_count_of_month between 0 and 12) 
 a 
CROSS JOIN 
(select	count(a24.row_key)*1.0 AS opened_Incidents
from	ldb.f_incident	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12   
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
 and a15.lagging_count_of_month between 0 and 12)
 UNION
 select	'First call resolution incidents'as metrics,count(a24.row_key) AS value
from	ldb.f_incident_resolved	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.last_resolved_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a24.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.first_call_resolution_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 12)
 union
 SELECT 'First Contact Resolution Incidents Percent' as metrics,
(a.first_contact_resolution_c_flag/b.closed_incidents)*100*1.0 as value
FROM 
(select	count(a11.row_key)*1.0 AS first_contact_resolution_c_flag
from	ldb.f_incident_closed	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.closed_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.first_contact_resolution_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 12 )
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.0 AS closed_incidents
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12 
) b 

union

select	'Incident Open To Close Duration' as metrics,sum((a11.open_to_close_duration / 3600)) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12

union

select	'Reopened count'as metrics,sum(a11.reopened_count) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12

union
select	'Incident UK Open to Close Business Duration Hrs' as metrics,(sum(a11.uk_business_duration_c) / 3600.0) AS value
from	ldb.f_incident_closed	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
union
select	'Incident Caused by Change' as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.caused_by_change_flag='Y'
 and a14.lagging_count_of_month between 0 and 12)
 UNION
 select	'Incident Caused By Problem' as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.problem_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 12)
UNION 
select 'Incident Causing Knowledge' as metrics,count(a11.row_key)*1.00 AS value
from	ldb.f_incident	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.knowledge_flag='Y'
 and a14.lagging_count_of_month between 0 and 12)
 UNION
 SELECT 'Incident Fix Rate' as metrics,a.X/b.Y*100.00 as value
FROM 
(select	count(a11.row_key)*1.00 AS X
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12    
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.00 AS Y
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
) b
UNION
select	'Incident Pending Changes' as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.change_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 12)
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
 and a15.lagging_count_of_month between 0 and 12)
 
union
select	'Int FCR'as metrics,count(a11.row_key) AS value
from	ldb.f_incident_resolved	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.last_resolved_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.international_first_contact_resolution_flag_c = 'Y'
 and a14.lagging_count_of_month between 0 and 12)

 union
 
select	'Int FTR' as metrics,count(a11.row_key) AS value
from	ldb.f_incident_resolved	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.last_resolved_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	(a12.international_first_time_resolution_flag_c = 'Y'
 and a14.lagging_count_of_month between 0 and 12)

 union
select 'MTTR (Days)'as metrics,
coalesce ((a.Sum_of_Open_to_Resolve_Duration/86400.0)/(b.Resolved_Incidents))*1.0as value from -- ***DATA NOT MATCHING
(
select	count(a11.row_key)*1.0 AS Resolved_Incidents
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12 
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
 and a15.lagging_count_of_month between 0 and 12
 ) 
 )a
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
 and a14.lagging_count_of_month between 0 and 12)
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
 and a14.lagging_count_of_month between 0 and 12)
 
 UNION
 select	'Multiple categorization incident' as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.multiple_categorization_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 12)
 UNION 
 SELECT 'Multiple categorization incident Percentage' as metrics,
(a.X/b.Y) *100.0 as value
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
 and a14.lagging_count_of_month between 0 and 12)  
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.00 AS Y
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
) b
union 
SELECT 'Open Incidents Escalated'as metrics,count(a.row_key) as value
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
join	ldb.d_incident_state	a13	  on 	(a.state_src_key = a13.row_key)
where  a13.wh_dimension_code not in ('RESOLVED', 'CLOSED') and d.lagging_count_of_month between 0 and 12 
and b.priority_escalated_flag='Y'
union 
SELECT 'Open Incidents overdue' as metrics,count(a.row_key) as value
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
join	ldb.d_incident_state	a13	  on 	(a.state_src_key = a13.row_key)
where  a13.wh_dimension_code not in ('RESOLVED', 'CLOSED') and d.lagging_count_of_month between 0 and 12 
and b.over_due_flag='Y'
union

 select	'Opened Incidents' as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	(a12.lagging_count_of_month between 0 and 12)
union
select	'Opened Incidents Last 30 days' as metrics,count(a11.row_key) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	(a12.lagging_count_of_days between 0 and 29)
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
 and a14.lagging_count_of_month between 0 and 12)
 UNION 
SELECT 'Overdue Incidents Percent' as metrics,a.ABC/b.XYZ*100 as value
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
where d.lagging_count_of_month between 0 and 12 ) b 
union
SELECT 'Percent of Incidents Caused by Change' as metrics,a.ABC/b.XYZ*100 as value
FROM 
(SELECT count(a.row_key)*1.0 as ABC
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
AND d.lagging_count_of_month between 0 and 12
where b.caused_by_change_flag='Y') a 
CROSS JOIN 
(SELECT count(a.row_key)*1.0 as XYZ
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 12) b 
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
 and a14.lagging_count_of_month between 0 and 12)
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
 and a14.lagging_count_of_month between 0 and 12)
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
 and a14.lagging_count_of_month between 0 and 12)
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
 and a14.lagging_count_of_month between 0 and 12)
 UNION
 select	'Resolved Incidents' as metrics,count(a11.row_key) AS value
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
UNION
SELECT 'Resolved Incidents Missed Any SLAs'as metrics,
count(a.incident_key) AS value
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key 
WHERE b.met_sla_flag='N'
and d.lagging_count_of_month between 0 and 12
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
 and a14.lagging_count_of_month between 0 and 12) 
) a 
CROSS JOIN 
(select	count(a11.row_key)*1.0  AS Y
from	ldb.f_incident_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
) b 

union

select	'Time Worked Secs'as metrics,sum(a11.time_in_seconds_c) AS value
from	ldb.f_incident	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12


