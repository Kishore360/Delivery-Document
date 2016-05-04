

select 'f_change_request' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
union
select  'd_lov' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join  asu_mdwdb.d_lov   b
on  (a.approval_state_src_key = b.row_key)
UNION
select  'd_internal_contact' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join  asu_mdwdb.d_internal_contact  b
on  (a.change_requester_c_key = b.row_key)
union
select  'd_lov1' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join  asu_mdwdb.d_lov   b
on  (a.closed_status_src_c_key = b.row_key)
union
select  'd_request_item' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join  asu_mdwdb.d_request_item   b
on  (a.change_document_c_key = b.row_key)