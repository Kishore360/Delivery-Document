 select 'change' as table_name,count(1) Row_Count from ldb.f_change_request 
join ldb.d_calendar_date d on opened_on_key=d.row_key
where lagging_count_of_month between 0 and 2
union
 select 'incident' as table_name,count(1) Row_Count from ldb.f_incident
join ldb.d_calendar_date d on opened_on_key=d.row_key
where lagging_count_of_month between 0 and 2
union
 select 'problem' as table_name,count(1) Row_Count from  ldb.f_problem
join ldb.d_calendar_date d on opened_on_key=d.row_key
where lagging_count_of_month between 0 and 2
union



