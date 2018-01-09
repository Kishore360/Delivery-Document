SELECT count(a.row_key) as Problem_Backlog_Missed_All_SLAs
FROM ldb.f_problem a 
JOIN ldb.d_problem b ON a.problem_key=b.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
where d.lagging_count_of_month between 0 and 12 
AND b.backlog_flag='Y' AND b.met_sla_flag='N'

