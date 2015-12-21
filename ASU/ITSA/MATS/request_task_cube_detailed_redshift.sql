select 'f_request_task' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_task a
union
select  'd_lov' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_task a
join  asu_mdwdb.d_lov   b
on  (a.stage_src_key= b.row_key)
union
select  'd_request_item' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_task a
join  asu_mdwdb.d_request_item b
on  (a.request_item_key= b.row_key)
union
select  'd_lov 1' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_task a
join  asu_mdwdb.d_lov b
on  (a.state_src_key = b.row_key)
union
select  'd_calendar_date' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_task a
join  asu_mdwdb.d_calendar_date b
on  (a.due_on_key = b.row_key)
union
select  'd_calendar_date 1' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_task a
join  asu_mdwdb.d_calendar_date b
on  (a.opened_on_key = b.row_key)
union
select  'd_internal_contact' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_task a
join  asu_mdwdb.d_internal_contact b
on  (a.opened_by_key = b.row_key)
union
select 'd_request' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_task a
join  asu_mdwdb.d_request b
on  (a.request_c_key = b.row_key) 
union
select 'd_internal_contact 1' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_task a
join  asu_mdwdb.d_internal_contact b
on  (a.assigned_to_key= b.row_key) 
union
select 'd_internal_organization' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_task a
join  asu_mdwdb.d_internal_contact b
on  (a.assignment_group_key= b.row_key) 
union
select 'd_calendar_date 2' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_task a
join  asu_mdwdb.d_calendar_date b
on  (a.work_end_on_c_key= b.row_key) 
union
select 'd_lov 2' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_task a
join  asu_mdwdb.d_lov b
on  (a.approval_state_src_key = b.row_key)
union
select 'd_lov 2' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_task a
join  asu_mdwdb.d_lov b
on  (a.urgency_src_key = b.row_key)
union
select 'd_lov 3' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_task a
join  asu_mdwdb.d_lov b
on  (a.priority_src_key = b.row_key)
