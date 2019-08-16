select 'ldb.f_problem_task	a11 ' as Table_name, count(1) Row_Count
from ldb.f_problem_task	a11 
union
select 'ldb.d_calendar_date	a12 ' as Table_name, count(1) Row_Count
from ldb.f_problem_task	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_problem_task	a13 ' as Table_name, count(1) Row_Count
from ldb.f_problem_task	a11 
join	ldb.d_problem_task	a13 
on (a11.problem_task_key = a13.row_key) 
union
select 'ldb.d_lov_problem_task_action_type_c	a124 ' as Table_name, count(1) Row_Count
from ldb.f_problem_task	a11 
join	ldb.d_problem_task	a13 
on (a11.problem_task_key = a13.row_key) 
join	ldb.d_lov_problem_task_action_type_c	a124 
on (a13.action_type_src_c_key = a124.row_key) 
union
select 'ldb.d_calendar_month	a14 ' as Table_name, count(1) Row_Count
from ldb.f_problem_task	a11 
join	ldb.d_calendar_date	a12 
on (a11.opened_on_key = a12.row_key) 
join	ldb.d_calendar_month	a14 
on (a12.month_start_date_key = a14.row_key) 
union
select 'ldb.d_problem	a116 ' as Table_name, count(1) Row_Count
from ldb.f_problem_task	a11 
join	ldb.d_problem	a116 
on (a11.problem_key = a116.row_key) 
union
select 'ldb.d_application	a117 ' as Table_name, count(1) Row_Count
from ldb.f_problem_task	a11 
join	ldb.d_application	a117 
on (a11.application_key = a117.row_key) 
union
select 'ldb.d_problem_task_assignment_group_support_group_business_unit_c a111 ' as Table_name, count(1) Row_Count
from ldb.f_problem_task	a11 
join	ldb.d_internal_organization_group a110 
on (a11.assignment_group_key = a110.row_key) 
join	ldb.d_problem_task_assignment_group_support_group_business_unit_c a111 
on (a110.business_unit_c_key = a111.row_key) 
union
select 'ldb.d_internal_contact_vp_svp_pm_action_items_c	a125 ' as Table_name, count(1) Row_Count
from ldb.f_problem_task	a11 
join	ldb.d_internal_organization_group a110 
on (a11.assignment_group_key = a110.row_key) join	ldb.d_problem_task_assignment_group_support_group_business_unit_c a111 
on (a110.business_unit_c_key = a111.row_key) 
join	ldb.d_internal_contact_vp_svp_pm_action_items_c	a125 
on (a111.vp_svp_c_key = a125.row_key) 
union
select 'ldb.d_internal_organization_group a110 ' as Table_name, count(1) Row_Count
from ldb.f_problem_task	a11 
join	ldb.d_internal_organization_group a110 
on (a11.assignment_group_key = a110.row_key) 