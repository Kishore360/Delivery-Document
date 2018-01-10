SELECT 
'Breached Time to Publish Findings Problems',
sum(a.findings_publish_duration_c) as Breached_Time_to_Publish_Findings_Problems
FROM ldb.f_problem_closed_c a 
join ldb.d_problem d
on a.problem_key=d.row_key
JOIN ldb.d_calendar_date b 
ON a.closed_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where d.findings_publish_c_flag ='Y'
and c.lagging_count_of_month between 0 and 11