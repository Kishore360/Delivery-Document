
SELECT 
'Bussiness_Duration',
sum(a.business_duration)/86400 AS Bussiness_Duration 
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
where b.lagging_count_of_month between 0 and 12