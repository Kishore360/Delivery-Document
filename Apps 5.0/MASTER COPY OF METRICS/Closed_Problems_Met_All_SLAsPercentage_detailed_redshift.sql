
SELECT a.ABC/b.XYZ*100 as Closed_Problems_Met_All_SLAsPercentage
FROM 
(
SELECT count(a.row_key) as ABC 
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 12
AND b.met_sla_flag='Y') a 
CROSS JOIN 
(SELECT count(a.row_key) as XYZ 
FROM ldb.f_problem_closed a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 12) b 
