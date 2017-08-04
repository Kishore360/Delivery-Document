select 'ldb.f_adhoc_request_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
union
select 'ldb.d_internal_organization_legalentity a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_internal_organization_legalentity a12 
on (a11.company_key = a12.row_key) 
union
select 'ldb.d_location a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_location a13 
on (a11.location_key = a13.row_key) 
union
select 'ldb.d_customer a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_customer a14 
on (a11.customer_key = a14.row_key) 
union
select 'ldb.d_internal_contact a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) 
union
select 'ldb.d_calendar_time a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_adhoc_request_c a11 
join ldb.d_calendar_time a16 
on (a11.opened_time_key = a16.row_key) 
