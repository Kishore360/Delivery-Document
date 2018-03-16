-- Need to reorder the names in the columns -- 

SELECT '% of Closed Problems Met SLA' as metrics,round((a.ABC/b.XYZ)*100.00 ,0)as value 
FROM 
(
SELECT count(a.row_key)*1.00 as ABC 
FROM ldb.f_problem_resolved a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40
AND b.met_sla_flag='Y') a 
CROSS JOIN 
(SELECT count(a.row_key)*1.00 as XYZ 
FROM ldb.f_problem_resolved a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40) b 
union
select	'Actual Elapsed Time SLA Hrs' as metrics,sum((a11.met_sla_duration_c / 3600.0)) AS value
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 40
union
SELECT 'All Problem Tasks'as metrics,sum(a.problem_tasks_count) AS value
from ldb.f_problem a 
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where c.lagging_count_of_month between 0 and 40
union
SELECT 'Avg # of Reassignments'as metrics,a.abc*1.0/b.bcd*1.0 as value from  
(select sum(a.reassignment_count)*1.0 abc FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40 )a
cross join 
(select count(a.row_key)*1.0as bcd FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40 )b
union
SELECT 'Avg # of Related Incidents'as metrics,(a.abc/b.bcd) as value from  
(select sum(a.linked_incident_count)*1.00 abc FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40 )a
cross join 
(select count(a.row_key)*1.00as bcd FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40 )b
union
select	' Avg Age Days' as metrics,	(sum(a11.age)*1.00/count(a11.row_key)*1.00) AS value 
from	ldb.f_problem	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 40
union
SELECT -- ( ***MSTR retrieves it from opened fact but should come from closed fact-TO BE CORRECTED)
'Avg Problems Open to Close Duration (Hours)'as metrics,
(SUM(a.open_to_close_duration)/3600.0)/count(a.row_key) as value
FROM ldb.f_problem_resolved a 
JOIN ldb.d_calendar_date b 
ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 40
union
SELECT 'Closed Problems'as metrics,count(a.row_key) as value
FROM ldb.f_problem_resolved a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40

union
SELECT 'Closed Problems Met SLA'as metrics,count(a.row_key) as value 
FROM ldb.f_problem_resolved a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40
AND b.met_sla_flag='Y'
union
SELECT 'Closed Problems Missed SLA'as metrics,count(a.row_key) as value
FROM ldb.f_problem_resolved a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40 
and  b.met_sla_flag='N'

union

SELECT 'Dormant Problems' as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40 
AND  b.dormant_flag='Y'
union
SELECT 'Known Errors' as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40 
AND  b.known_error_flag='Y'

union
SELECT 'Open Problems Met SLA'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where backlog_flag='Y' and   d.lagging_count_of_month between 0 and 40
and  b.met_sla_flag='Y'

union
SELECT 'Opened Problems Missed SLA' as metrics,count(a.row_key) as value
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_problem_state e
on a.state_src_key = e.row_key 
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where e.wh_dimension_name='OPEN'
and d.met_sla_flag='N'
and c.lagging_count_of_month between 0 and 40
union
SELECT 'Opened Problems' as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40 
union
SELECT 'Overdue Problems' as metrics,count(a.row_key) as value
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where d.over_due_flag='Y'
and c.lagging_count_of_month between 0 and 40
union
SELECT 'Overdue Problems percent' as metrics,(abc/bcd)*100.00 as value from 
(select count(a.row_key) as abc
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where d.over_due_flag='Y'
and c.lagging_count_of_month between 0 and 40)a
cross join 
(select count(a.row_key) as bcd
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where c.lagging_count_of_month between 0 and 40)
union
SELECT 'Priority Escalated Problems'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40 
AND b.priority_escalated_flag='Y'
union
SELECT 'Problem Backlog'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40 
AND b.backlog_flag='Y'
union
SELECT 'Problems Generating Knowledge'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40 
AND b.knowledge_flag='Y'

union
SELECT 'Problems Pending Change'as metrics,count(a.row_key) as value
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40 
AND b.change_flag='Y'

union
SELECT  'Problems Reassigned'as metrics,sum(a.reassignment_count) as value
from ldb.f_problem a 
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where reassignment_count>0 and  c.lagging_count_of_month between 0 and 40
union
SELECT  'Problems Resolved By change'as metrics,count(a.*) as value
from ldb.f_problem a 
join ldb.d_problem d on a.problem_key=d.row_key
join ldb.d_problem_state e
on a.state_src_key = e.row_key 
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where e.wh_dimension_name in ('CLOSED') and 
change_flag='Y' and    c.lagging_count_of_month between 0 and 40
union
SELECT 'Problems Without Related Incidents'as metrics,count(a.row_key) as value
from ldb.f_problem a 
join ldb.d_problem d
on a.problem_key=d.row_key
join ldb.d_calendar_date b 
on a.opened_on_key = b.row_key 
join ldb.d_calendar_month c 
on b.month_start_date_key = c.row_key 
where d.linked_incident_flag='N'
and c.lagging_count_of_month between 0 and 40
union
SELECT 'Related_Incidents'as metrics,sum(a.linked_incident_count) as value
FROM ldb.f_problem  a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 40
