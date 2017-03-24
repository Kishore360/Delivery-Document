select 'f_request_item' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
union
select  'd_internal_contact' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_internal_contact_owner_c   b
on  (a.owner_c_key= b.row_key)
UNION
select  'd_configuration_item' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_configuration_item  b
on  (a.configuration_item_key = b.row_key)
union
select  'd_internal_contact 1' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_internal_contact_requester_c   b
on  (a.req_item_requester_c_key = b.row_key)
union
select  'd_calendar_date' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_calendar_date_closed   b
on  (a.due_on_key = b.row_key)
union
select  'd_calendar_date 1' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_calendar_date   b
on  (a.opened_on_key = b.row_key)
union
select  'd_internal_contact 2' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  asu_mdwdb.d_internal_contact   b
on  (a.owner_c_key= b.row_key)
UNION
select  'd_sc_req_item_priority' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_sc_req_item_priority   b
on  (a.priority_src_key= b.row_key)
UNION
select  'd_lov_contact_type_c' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  ldb.d_lov_contact_type_c   b
on  (a.contact_type_src_c_key= b.row_key)
UNION
select  'd_lov2' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  asu_mdwdb.d_lov   b
on  (a.urgency_src_key= b.row_key)
UNION
select  'd_lov3' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  asu_mdwdb.d_internal_contact  b
on  (a.assigned_to_key= b.row_key)
UNION
select  'd_lov4' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  asu_mdwdb.d_lov  b
on  (a.priority_src_key= b.row_key)
UNION
select  'd_lov5' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  asu_mdwdb.d_lov  b
on  (a.contact_type_src_c_key= b.row_key)
UNION
select  'd_lov6' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  asu_mdwdb.d_lov  b
on  (a.urgency_src_key= b.row_key)
UNION
select  'd_lov7' as Table_Name,count(a.row_key) Row_Count
from ldb.f_request_item    a
join  asu_mdwdb.d_internal_contact  b
on  (a.assigned_to_key= b.row_key)
UNION 
select 'ldb.dh_user_group_level1 a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level1 a124 
on (a14.lev_1_key = a124.row_key) 