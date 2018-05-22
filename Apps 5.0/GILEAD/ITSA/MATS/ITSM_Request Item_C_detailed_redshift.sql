select 'f_request_item' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
union
select  'd_internal_contact' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_internal_contact   b
on  (a.opened_by_key= b.row_key)
UNION
select  'd_master_item' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_master_item    b
on  (a.catalog_item_key = b.row_key)
union
select  'd_request_item' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_request_item   b
on  (a.request_item_key = b.row_key)
union
select  'd_internal_contact_requested_for' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_internal_contact_requested_for   b
on  (a.requested_for_key  = b.row_key)

union
select  'd_calendar_date' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_calendar_date   b
on  (a.opened_on_key = b.row_key)
union
select  'd_calendar_week' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_calendar_date   b
on  (a.opened_on_key = b.row_key)
join  ldb.d_calendar_week   c
on  (b.week_start_date_key = c.row_key)
union
select  'd_calendar_year' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_calendar_date   b
on  (a.opened_on_key = b.row_key)
join  ldb.d_calendar_year   c
on  (b.year_start_date_key = c.row_key)
union
select  'd_calendar_month' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_calendar_date   b
on  (a.opened_on_key = b.row_key)
join  ldb.d_calendar_month   c
on  (b.month_start_date_key = c.row_key)

union
select  'd_internal_contact_assigned_to' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_internal_contact_assigned_to   b
on  (a.assigned_to_key= b.row_key)
UNION
select  'd_internal_organization_group ' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_internal_organization_group    b
on  (a.assignment_group_key= b.row_key)
UNION
select  'ldb.d_internal_contact_mdm  ' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_internal_contact   b
on  (a.opened_by_key= b.row_key)
join  ldb.d_internal_contact_mdm     c
on  (c.row_current_key= b.row_current_key)
UNION
select  'd_hr_change_category' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_hr_change_category   b
on  (a.hr_category_src_key= b.row_key)
UNION
select  'd_hr_change' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_hr_change  b
on  (a.hr_change_key= b.row_key)
UNION
select  'd_request' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_request  b
on  (a.request_key= b.row_key)
UNION
select  'd_sc_req_item_approval' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_sc_req_item_approval  b
on  (a.approval_state_src_key= b.row_key)
UNION
select  'd_request_item_stage' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_request_item_stage  b
on  (a.stage_src_key= b.row_key)
UNION
select  'd_request_item_state ' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_request_item_state   b
on  (a.state_src_key= b.row_key)
UNION
select  'd_internal_contact_task_closed_by ' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_internal_contact_task_closed_by   b
on  (a.closed_by_key= b.row_key)