 select 'problem' as table_name,count(a11.row_key) Row_Count from  ldb.f_request_item a11
join ldb.d_calendar_date d on (a11.opened_on_key=d.row_key)
where lagging_count_of_month between 0 and 2
union
 select 'change' as table_name,count(a11.row_key) Row_Count from ldb.f_change_request a11
join ldb.d_calendar_date d on (a11.opened_on_key=d.row_key)
where lagging_count_of_month between 0 and 2
union
 select 'incident' as table_name,count(a11.row_key) Row_Count from ldb.f_incident a11
join ldb.d_calendar_date d on (a11.opened_on_key=d.row_key)
where lagging_count_of_month between 0 and 2
union
select 'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
FROM ldb.f_request_task a11
JOIN ldb.d_calendar_date a12  on (a11.opened_on_key = a12.row_key)
where lagging_count_of_month between 0 and 2