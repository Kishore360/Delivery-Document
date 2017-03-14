select 'ldb.f_service_request_c_resolved a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c_resolved a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c_resolved a11 
join ldb.d_calendar_date a12 
on (a11.last_resolved_on_key = a12.row_key) 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_c_resolved a11 
join ldb.d_internal_contact a12 
on (a11.last_resolved_by_key = a12.row_key)