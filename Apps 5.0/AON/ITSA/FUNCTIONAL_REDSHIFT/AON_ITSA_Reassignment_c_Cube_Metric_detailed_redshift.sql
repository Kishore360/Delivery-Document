
select  
'Assignment Delay %',
(a.x/b.y)*100  from
(

select count(a11.incident_key)*1.0 as x
from ldb.f_incident_activity a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_state a110 
on (a12.state_src_key = a110.row_key) 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12 and a110.wh_dimension_code in ('RESOLVED','CLOSED')
and a11.reassignment_count>=1) a
cross join (
select count(a11.incident_key)*1.0 as y
from ldb.f_incident_activity a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_state a110 
on (a12.state_src_key = a110.row_key) 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12 and a110.wh_dimension_code in ('RESOLVED','CLOSED')) b 
UNION 
SELECT 'Assignment Delay Duration (Hours)',
SUM(a.delay_c)/3600.0 
FROM ldb.f_incident_activity a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.assigned_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 12 
UNION 
SELECT 'Duration (Days)',SUM(a.assigned_duration)/86400 
FROM ldb.f_incident_activity a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.assigned_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 12 
UNION 
SELECT 'Transfer %',
a.X/b.Y *100.0 as Z 
FROM 
(
SELECT SUM(a.out_records)*1.0 AS X 
FROM ldb.f_incident_activity a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.assigned_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 12 
) a 
CROSS JOIN 
(
SELECT SUM(a.in_records)*1.0 AS Y 
FROM ldb.f_incident_activity a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_calendar_date c ON a.assigned_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
Where d.lagging_count_of_month between 0 and 12 
) b 
UNION 
select 
'Transfer Delay Time (Hours)',
sum(a11.delay_c)/3600
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12










