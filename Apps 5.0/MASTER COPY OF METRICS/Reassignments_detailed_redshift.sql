SELECT 
'Reassignments',
count(a.reassignment_count) as Reassignments
FROM ldb.f_request_task a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
WHERE b.lagging_count_of_month between 0 and 24 