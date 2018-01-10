SELECT a.X/b.Y AS Percent_Breached_Time_to_Publish_Findings
FROM 
(
SELECT 
sum(a.findings_publish_duration_c) as X
FROM ldb.f_problem_closed_c a 
join ldb.d_problem d
on a.problem_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where d.findings_publish_c_flag ='Y'
and c.lagging_count_of_month between 0 and 11
)a
CROSS JOIN
(
SELECT 
count(a.row_key) as Y
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11)b