select 'f_problem_task' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
union
select  'd_internal_contact' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join  ldb.d_internal_contact  b
on  (a.prob_task_requester_c_key = b.row_key)
UNION 
select  'd_problem' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join  ldb.d_problem  b
on  (a.problem_key = b.row_key)
UNION 
select  'd_problem_task' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join  ldb.d_problem_task   b
on  (a.problem_task_key = b.row_key)
union
select  'ldb.d_problem_task_priority' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join  ldb.d_problem_task_priority   b
on  (a.priority_src_key = b.row_key)
union
select  'd_internal_contact1' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join ldb.d_internal_contact   b
on  (a.opened_by_key = b.row_key)
union
select  'd_internal_contact2' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join ldb.d_internal_contact   b
on  (a.closed_by_key = b.row_key)
union
select  'd_internal_contact3' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join ldb.d_internal_contact   b
on  (a.assigned_to_key = b.row_key)
union
select  'ldb.d_problem_task_urgency' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join  ldb.d_problem_task_urgency   b
on  (a.urgency_src_key = b.row_key)
union
select  'd_configuration_item ' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join  ldb.d_configuration_item   b
on  (a.configuration_item_key = b.row_key)
union
select  'd_internal_organization ' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join  ldb.d_internal_organization_group    b
on  (a.assignment_group_key = b.row_key)
union
select  'd_internal_contact' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join  ldb.d_internal_contact  b
on  (a.prob_task_requester_c_key = b.row_key)
UNION 
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count				
from ldb.f_problem_task a11
join ldb.d_calendar_date a16
on (a11.closed_on_key = a16.row_key)		  
join ldb.d_calendar_month a128
on (a16.month_start_date_key = a128.row_key)