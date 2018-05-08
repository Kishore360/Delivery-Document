 select 'change' as table_name,count(a11.row_key) Row_Count from ldb.f_change_request a11
join ldb.d_calendar_date d on (a11.opened_on_key=d.row_key
where lagging_count_of_month between 0 and 2)
union
 select 'incident' as table_name,count(a11.row_key) Row_Count from ldb.f_incident a11
join ldb.d_calendar_date d on (a11.opened_on_key=d.row_key
where lagging_count_of_month between 0 and 2)
union
 select 'problem' as table_name,count(a11.row_key) Row_Count from  ldb.f_problem a11
join ldb.d_calendar_date d on (a11.opened_on_key=d.row_key
where lagging_count_of_month between 0 and 2)



