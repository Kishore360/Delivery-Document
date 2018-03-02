SELECT '%  Breached Time to Publish Findings' as metrics,(abc/xyz)*100.00 as value from 
(select	count(a11.row_key)*1.0 AS abc
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
where	a12.findings_publish_c_flag in ('Y') )a
cross join 
(select	count(a11.row_key) AS xyz
from	ldb.f_problem	a11 
)b
UNION
SELECT '% of Closed Problems Met SLA' as metrics,(abc/xyz)*100.00 as value from 
(select	count(a11.row_key) AS abc
from	ldb.f_problem_resolved	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
where	a12.met_sla_flag = 'Y')a
cross join 
(select	count(a11.row_key) AS xyz
from	ldb.f_problem_resolved	a11 
)b
UNION
select 'All Problem Tasks Count',
sum(a.problem_tasks_count) as All_Problem_Tasks
from ldb.f_problem a 
union
SELECT 'Avg # of Reassignments',(sum(a11.reassignment_count)*1.0/count(a11.row_key))*1.0 AS WJXBFS1
from	ldb.f_problem	a11
union
SELECT 'Avg # of Related Incidents',(sum(a11.linked_incident_count)*1.0/count(a11.row_key))*1.0
from	ldb.f_problem	a11
union
select	'Avg Age (days)',round(sum((a11.age / 86400.0))/count(a11.row_key) ,1)
from	ldb.f_problem	a11
union
select 'Avg Open to Close Duration'as metrics,(abc/xyz) as value from 
(select	sum((open_to_close_duration / 86400.0))*1.0 AS abc
from	ldb.f_problem_resolved )a
cross join 
(select	count(a11.row_key) AS xyz
from	ldb.f_problem	a11 )b
union
select	'Avg. Time to Publish Findings (Days)',sum((a11.findings_publish_duration_c / 86400.0))/count(a11.row_key) AS WJXBFS1
from	ldb.f_problem	a11
union
select	'Breached Time to Publish Findings Problems',count(a11.row_key) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
where	a12.findings_publish_c_flag in ('Y')
union
SELECT 'Closed Problems',count(a.row_key) as Closed_Problems
FROM ldb.f_problem_resolved a 
Union
SELECT 'Closed Problems Met SLA',count(a.row_key) as ABC 
FROM ldb.f_problem_resolved a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where b.met_sla_flag='Y'
Union
SELECT 'Closed Problems Missed SLA',count(a.row_key) as ABC 
FROM ldb.f_problem_resolved a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where b.met_sla_flag='N'
union
SELECT 'Dormant Problems',count(a.row_key) as Dormant_Problems
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where  b.dormant_flag='Y'
union
 SELECT 'Known Errors',count(a.row_key) as Known_Errors
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
where  b.known_error_flag='Y'
union
SELECT 'Open Problems Met SLA',count(a11.row_key) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
	join	ldb.d_problem_state	a13
	  on 	(a11.state_src_key = a13.row_key)
where	(a13.wh_dimension_code = 'OPEN'
 and a12.met_sla_flag = 'Y')
union
SELECT 'Open Problems Missed SLA',count(a11.row_key) AS WJXBFS1
from	ldb.f_problem	a11
	join	ldb.d_problem	a12
	  on 	(a11.problem_key = a12.row_key)
	join	ldb.d_problem_state	a13
	  on 	(a11.state_src_key = a13.row_key)
where	(a13.wh_dimension_code = 'OPEN'
 and a12.met_sla_flag = 'N')
union
SELECT 'Opened Problems',count(a.row_key) as Opened_Problems
FROM ldb.f_problem a 
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
sum(a11.reassignment_count) from	ldb.f_problem	a11
union
SELECT 'Problems Resolved by Change',count(a.row_key) as Problems_Removed_by_Change
FROM ldb.f_problem_resolved a 
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
select	'Time to Publish Findings (Days)',sum((a11.findings_publish_duration_c / 86400.0)) AS WJXBFS1
from	ldb.f_problem	a11
order by 1