SELECT '% of Closed Problems Met SLA' as metrics,(abc/xyz)*100.00 as value from 
(select	count(a11.row_key) AS abc
from	ldb.f_problem_closed	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
where	a12.met_sla_flag = 'Y')a
cross join 
(select	count(a11.row_key) AS xyz
from	ldb.f_problem_closed	a11 
)b
UNION
select	'% Of Problems against Failed Changes',round(((count((CASE WHEN (a13.source_dimension_name in ('1 - Critical', '2 - High') and a12.result_of_change_c_flag in ('Y')) THEN a11.row_key ELSE NULL END))*1.0)/
	((count((CASE WHEN a13.source_dimension_name in ('1 - Critical') THEN a11.row_key ELSE NULL END))*1.0)+(count((CASE WHEN a13.source_dimension_name in ('2 - High') THEN a11.row_key ELSE NULL END))*1.0)))*100,2) AS WJXBFS3
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
	join	ldb.d_lov_problem_severity_level_c	a13
	  on 	(a12.severity_level_c_key = a13.row_key)
where	((a13.source_dimension_name in ('1 - Critical', '2 - High')
 and a12.result_of_change_c_flag in ('Y'))
 or a13.source_dimension_name in ('1 - Critical')
 or a13.source_dimension_name in ('2 - High')) 
UNION
select	 
	'% of Sev1 Tickets Outage Caused by EA',round((count((CASE WHEN a13.source_dimension_name = 'EA' THEN a11.row_key ELSE NULL END))*1.0 /count((CASE WHEN a13.source_dimension_name in ('EA', 'EI', 'Vendor') THEN a11.row_key ELSE NULL END)))*100,2)
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
	join	ldb.d_lov_problem_category_c	a13
	  on 	(a11.category_src_key = a13.row_key)
	join	ldb.d_lov_problem_severity_level_c	a14
	  on 	(a12.severity_level_c_key = a14.row_key)
where	(a14.source_dimension_name = '1 - Critical'
 and (a13.source_dimension_name in ('EA', 'EI', 'Vendor')
 or a13.source_dimension_name = 'EA')) 
 union
 select	 
	'% of Sev1 Tickets Outage Caused by EI',round((count((CASE WHEN a13.source_dimension_name = 'EI' THEN a11.row_key ELSE NULL END))*1.0 /count((CASE WHEN a13.source_dimension_name in ('EA', 'EI', 'Vendor') THEN a11.row_key ELSE NULL END)*1.0))*100,2)
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
	join	ldb.d_lov_problem_category_c	a13
	  on 	(a11.category_src_key = a13.row_key)
	join	ldb.d_lov_problem_severity_level_c	a14
	  on 	(a12.severity_level_c_key = a14.row_key)
where	(a14.source_dimension_name = '1 - Critical'
 and (a13.source_dimension_name in ('EA', 'EI', 'Vendor')
 or a13.source_dimension_name = 'EA')) 
 union
 select	 
	'% of Sev1 Tickets Outage Caused by Vendor',round((count((CASE WHEN a13.source_dimension_name = 'Vendor' THEN a11.row_key ELSE NULL END))*1.0 /count((CASE WHEN a13.source_dimension_name in ('EA', 'EI', 'Vendor') THEN a11.row_key ELSE NULL END)))*100,2)
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
	join	ldb.d_lov_problem_category_c	a13
	  on 	(a11.category_src_key = a13.row_key)
	join	ldb.d_lov_problem_severity_level_c	a14
	  on 	(a12.severity_level_c_key = a14.row_key)
where	(a14.source_dimension_name = '1 - Critical'
 and (a13.source_dimension_name in ('EA', 'EI', 'Vendor')
 or a13.source_dimension_name = 'EA')) 
 union
 SELECT 
'48Hrs Closed Problems',
count(a.row_key) as Hrs48_Closed_Problems
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
where d.closed_problem_48hrs_c_flag='Y'
and d.stable_to_rca_c_flag='Y'
Union
SELECT 
'All Problem Tasks Count',
sum(a.problem_tasks_count) as All_Problem_Tasks
from ldb.f_problem a 
union
SELECT 'Avg # of Reassignments',Avg(a.reassignment_count)*1.00 as Avg_#_of_Reassignments
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
union
SELECT 'Avg # of Related Incidents',sum((CASE WHEN a11.linked_incident_count is null  THEN 0 ELSE a11.linked_incident_count END))/count(a11.row_key) 
from	ldb.f_problem	a11
union
select	'Avg Age (days)',round(sum((a11.age / 86400.0))/count(a11.row_key) ,1)
from	ldb.f_problem	a11
union
select 'Avg Open to Close Duration',sum((a11.open_to_close_duration / 86400.0))/count(a11.row_key)
from	ldb.f_problem_closed a11
union
select	'Avg Outage Duration',round(((sum((CASE WHEN a13.source_dimension_name in ('2 - High') THEN a11.outage_duration_c ELSE NULL END)) / 86400.0) +(sum((CASE WHEN a13.source_dimension_name in ('1 - Critical') THEN a11.outage_duration_c ELSE NULL END)) / 86400.0))/(
	count((CASE WHEN a13.source_dimension_name in ('2 - High') THEN a11.row_key ELSE NULL END))+	count((CASE WHEN a13.source_dimension_name in ('1 - Critical') THEN a11.row_key ELSE NULL END))),2)
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
	join	ldb.d_lov_problem_severity_level_c	a13
	  on 	(a12.severity_level_c_key = a13.row_key)
where	(a13.source_dimension_name in ('2 - High')
 or a13.source_dimension_name in ('1 - Critical')) 
 union
SELECT 'Closed Problems',count(a.row_key) as Closed_Problems
FROM ldb.f_problem_closed a 
Union
SELECT 'Closed Problems Met SLA',count(a.row_key) as ABC 
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where b.met_sla_flag='Y'
Union
SELECT 'Closed Problems Missed SLA',count(a.row_key) as ABC 
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where b.met_sla_flag='N'
union
SELECT 'Dormant Problems',count(a.row_key) as Dormant_Problems
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where  b.dormant_flag='Y'
union
select	'Failed Changes (Sev 1 & 2)',count(a11.row_key) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
	join	ldb.d_lov_problem_severity_level_c	a13
	  on 	(a12.severity_level_c_key = a13.row_key)
where	(a13.source_dimension_name in ('1 - Critical', '2 - High')
 and a12.result_of_change_c_flag in ('Y'))
 union
 SELECT 'Known Errors',count(a.row_key) as Known_Errors
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where  b.known_error_flag='Y'
union
SELECT
'MIG Related Outage Duration (days)',
count(a.outage_duration_c)/86400.0 as MIG_Related_Outage_Duration
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_lov_problem_root_cause_category_c f
on (d.root_cause_category_c_key = f.row_key)
where f.source_dimension_name not in ('Vendor')
union
SELECT
'MIG Related Problems',
count(a.row_key) as MIG_Related_Problems
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_lov_problem_root_cause_category_c f
on (d.root_cause_category_c_key = f.row_key)
where f.source_dimension_name not in ('Vendor')
union
SELECT 'Open Problems Met SLA',count(a.row_key) as Open_Problems_Met_SLA
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where b.met_sla_flag='Y'
union
SELECT 'Open Problems Missed SLA',count(a.row_key) as Open_Problems_Met_SLA
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where b.met_sla_flag='N'
union
SELECT 'Opened Problems',count(a.row_key) as Opened_Problems
FROM ldb.f_problem a 
union
select	'Outage Duration',sum(a11.outage_duration_c) AS outage_duration
from	ldb.f_problem	a11
union
SELECT
'Outage Time Sev1',
sum(a.outage_duration_c)/60.0 as Outage_Time_Sev1
from
 ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_lov_problem_severity_level_c   e
on (d.severity_level_c_key = e.row_key)
where e.source_dimension_name in ('1 - Critical')
union
SELECT
'Outage Time Sev2',
sum(a.outage_duration_c)/3600.0 as Outage_Time_Sev2
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_lov_problem_severity_level_c   e
on (d.severity_level_c_key = e.row_key)
where e.source_dimension_name in ('2 - High')
union
SELECT 
'Overdue Problems',
count(a.row_key) as Overdue_Problems
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
where d.over_due_flag='Y'
union
SELECT 'Overdue Problems Percent' as metrics,(abc/xyz)*100.00 as value from 
(select	count(a11.row_key) AS abc
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
where	a12.over_due_flag = 'Y' )a
cross join 
(select	count(a11.row_key) AS xyz
from	ldb.f_problem	a11  
)b
union
SELECT 'Priority Escalated Problems',count(a.row_key) as Priority_Escalated_Problems
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where b.priority_escalated_flag='Y'
union
SELECT 'Problem Backlog',count(a.row_key) as Problem_Backlog
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where b.backlog_flag='Y'
union
SELECT 'Problems Generating Knowledge',count(a.row_key) as Problems_Generating_Knowledge
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where b.knowledge_flag='Y'
union
SELECT 'Problems Pending Change',count(a.row_key) as Problems_Pending_Change
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where b.change_flag='Y'
union
SELECT 
'Problems Reassigned',
count(a.reassignment_count) as Problems_Reassigned
from ldb.f_problem a 
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
union
SELECT 'Problems Resolved by Change',count(a.row_key) as Problems_Removed_by_Change
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where b.change_flag='Y'
union
SELECT 'Problems Without Related Incidents',
count(a.row_key) as Problems_Without_Related_Incidents
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key 
where d.linked_incident_flag='N'
union
SELECT 'Related Incidents',sum(a.linked_incident_count) as Related_Incidents
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
union
SELECT 
'Result of Change',
count(a.row_key) as Result_Of_Change_Problems
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
where d.closed_problem_48hrs_c_flag='Y'
and d.result_of_change_c_flag='Y'
union
select	'Sev 1',count(a11.row_key) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
	join	ldb.d_lov_problem_severity_level_c	a13
	  on 	(a12.severity_level_c_key = a13.row_key)
where	a13.source_dimension_name in ('1 - Critical')
union
SELECT
'Sev 1 - Average Outage Time (Mins)',
(sum(a.outage_duration_c/60.0) / count(a.row_key)) as Avg_Outage_Time_Sev1_Minutes
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_lov_problem_severity_level_c   e
on (d.severity_level_c_key = e.row_key)
where e.source_dimension_name in ('1 - Critical')
union
select	'Sev 2',count(a11.row_key) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
	join	ldb.d_lov_problem_severity_level_c	a13
	  on 	(a12.severity_level_c_key = a13.row_key)
where	a13.source_dimension_name in ('2 - High')
union
select	'Sev 3',count(a11.row_key) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
	join	ldb.d_lov_problem_severity_level_c	a13
	  on 	(a12.severity_level_c_key = a13.row_key)
where	a13.source_dimension_name in ('3 - Medium')
union
select	'Sev 4',count(a11.row_key) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
	join	ldb.d_lov_problem_severity_level_c	a13
	  on 	(a12.severity_level_c_key = a13.row_key)
where	a13.source_dimension_name in ('4 - No impact')
union
SELECT
'Total Outage Duration',
sum(a.total_outage_duration)/86400.0 as Total_Outage_Duration
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
union
SELECT
'Total Outage Time',
sum(a.outage_duration_c)/3600.0 as Total_Outage_Time
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_lov_problem_severity_level_c   e
on (d.severity_level_c_key = e.row_key)
where e.source_dimension_name in ('1 - Critical','2 - High')
union
SELECT 
'Total Problem Ticket Sev 1 & 2++',
count(a.row_key) as Total_Problem_Ticket_Sev1_Sev2
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_lov_problem_severity_level_c   e
on (d.severity_level_c_key = e.row_key) 
where e.source_dimension_name in ('1 - Critical','2 - High')
union
SELECT
'Vendor Related Outage Duration (days)',
count(a.outage_duration_c)/86400.0 as Vendor_Related_Outage_Duration
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_lov_problem_root_cause_category_c f
on (d.root_cause_category_c_key = f.row_key)
where f.source_dimension_name like '%Vendor%'
union
SELECT
'Vendor Related Problems',
count(a.row_key) as Vendor_Related
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_lov_problem_root_cause_category_c f
on (d.root_cause_category_c_key = f.row_key) 
where f.source_dimension_name like '%Vendor%'
union
SELECT
'Work Duration',
sum(a.work_duration_c) as Work_Duration
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
order by 1








