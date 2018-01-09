SELECT 
'Avg of Problems Age (days)',
(SUM(a.age)/86400.0/count(a.row_key)) as Avg_of_Problems_Age_Days
FROM ldb.f_problem a 
JOIN ldb.d_calendar_date b 
ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c
ON b.month_start_date_key = c.row_key
where c.lagging_count_of_month between 0 and 11