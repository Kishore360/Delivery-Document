


select 'f_problem_task' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
union
select  'd_internal_contact' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join  ldb.d_internal_contact  b
on  (a.prob_task_requester_c_key = b.row_key)
union
select  'd_lov1' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join  asu_mdwdb.d_lov   b
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
select  'd_lov2' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join  asu_mdwdb.d_lov   b
on  (a.urgency_src_key = b.row_key)
union
select  'd_configuration_item ' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join  ldb.d_configuration_item   b
on  (a.configuration_item_key = b.row_key)
union
select  'd_internal_organization ' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem_task    a
join  asu_mdwdb.d_internal_organization    b
on  (a.assignment_group_key = b.row_key)