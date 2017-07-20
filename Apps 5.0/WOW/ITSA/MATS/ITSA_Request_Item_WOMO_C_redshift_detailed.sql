select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_request_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a13 
on (a11.request_item_key = a13.row_key) 
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
union
select 'ldb.d_internal_contact_mdm a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_contact_mdm a15 
on (a14.row_current_key = a15.row_current_key) 
union
select 'ldb.d_request_item_stage a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_stage a16 
on (a11.stage_src_key = a16.row_key) 
