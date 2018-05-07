 select 'incident' as table_name,count(1) Row_Count from gilead_mdwdb.f_incident
join gilead_mdwdb.d_calendar_date d on opened_on_key=d.row_key
where lagging_count_of_month between 0 and 2
union
 select 'problem' as table_name,count(1) Row_Count from  gilead_mdwdb.f_problem
join gilead_mdwdb.d_calendar_date d on opened_on_key=d.row_key
where lagging_count_of_month between 0 and 2
union
 select 'change_request' as table_name,count(1) Row_Count from gilead_mdwdb.f_change_request 
join gilead_mdwdb.d_calendar_date d on opened_on_key=d.row_key
where lagging_count_of_month between 0 and 2


