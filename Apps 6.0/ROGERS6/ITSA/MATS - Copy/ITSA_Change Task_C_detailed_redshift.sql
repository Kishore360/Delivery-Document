select 'ldb.f_change_task	a11 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
union
select 'ldb.d_internal_contact	a12 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_internal_contact	a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_date	a13 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_calendar_date	a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_change_task	a14 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_change_task	a14 
on (a11.change_task_key = a14.row_key) 
union
select 'ldb.d_calendar_month	a15 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_calendar_date	a13 
on (a11.opened_on_key = a13.row_key) 
join	ldb.d_calendar_month	a15 
on (a13.month_start_date_key = a15.row_key) 
union
select 'ldb.d_calendar_month	a16 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_calendar_date	a13 
on (a11.opened_on_key = a13.row_key) 
join	ldb.d_calendar_month	a16 
on (a13.month_start_date_key = a16.row_key) 
union
select 'ldb.d_change_task_approval	a155 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_change_task	a14 
on (a11.change_task_key = a14.row_key) 
join	ldb.d_change_task_approval	a155 
on (a14.approval_src_key = a155.row_key) 
union
select 'ldb.d_change_request	a123 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_change_request	a123 
on (a11.fact_source_c_key = a123.row_key) 
union
select 'ldb.d_change_request_close_code	a133 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_change_request	a123 
on (a11.fact_source_c_key = a123.row_key) 
join	ldb.d_change_request_close_code	a133 
on (a123.close_code_src_key = a133.row_key) 
union
select 'ldb.d_change_request_phase	a143 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_change_request	a123 
on (a11.fact_source_c_key = a123.row_key) 
join	ldb.d_change_request_phase	a143 
on (a123.phase_src_key = a143.row_key) 
union
select 'ldb.d_change_request_phase_state	a153 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_change_request	a123 
on (a11.fact_source_c_key = a123.row_key) 
join	ldb.d_change_request_phase_state	a153 
on (a123.phase_state_src_key = a153.row_key) 
union
select 'ldb.d_change_task	a122 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_change_task	a122 
on (a11.change_task_key = a122.row_key) 
union
select 'ldb.d_change_task_approval	a134 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_change_task	a122 
on (a11.change_task_key = a122.row_key) 
join	ldb.d_change_task_approval	a134 
on (a122.approval_src_key = a134.row_key) 
union
select 'ldb.d_change_task_reported_type	a144 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_change_task	a122 
on (a11.change_task_key = a122.row_key) 
join	ldb.d_change_task_reported_type	a144 
on (a122.reported_type_src_key = a144.row_key) 
union
select 'ldb.d_change_task_impact	a154 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_change_task	a122 
on (a11.change_task_key = a122.row_key) 
join	ldb.d_change_task_impact	a154 
on (a122.impact_src_key = a154.row_key) 
union
select 'ldb.d_change_task_priority	a164 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_change_task	a122 
on (a11.change_task_key = a122.row_key) 
join	ldb.d_change_task_priority	a164 
on (a122.priority_src_key = a164.row_key) 
union
select 'ldb.d_change_task_state	a174 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_change_task	a122 
on (a11.change_task_key = a122.row_key) 
join	ldb.d_change_task_state	a174 
on (a122.state_src_key = a174.row_key) 
union
select 'ldb.d_change_task_task_type	a184 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_change_task	a122 
on (a11.change_task_key = a122.row_key) 
join	ldb.d_change_task_task_type	a184 
on (a122.task_type_src_key = a184.row_key) 
union
select 'ldb.d_change_task_urgency	a19 ' as Table_name, count(1) Row_Count
from ldb.f_change_task	a11 
join	ldb.d_change_task	a122 
on (a11.change_task_key = a122.row_key) 
join	ldb.d_change_task_urgency	a19 
on (a122.urgency_src_key = a19.row_key) 