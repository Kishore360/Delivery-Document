select 'ldb.f_service_request_keyword_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_keyword_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_keyword_c a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_keyword_c a11 
join ldb.d_internal_contact a13 
on (a11.employee_key = a13.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_keyword_c a11 
join ldb.d_internal_contact_opened_by_c a14 
on (a11.opened_by_key = a14.row_key) 
union
select 'ldb.d_calendar_date_fiscal a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_keyword_c a11 
join ldb.d_calendar_date_fiscal a15 
on (a11.fiscal_date_key = a15.row_key) 
union
select 'ldb.d_service_request_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_keyword_c a11 
join ldb.d_service_request_c a16 
on (a11.service_request_c_key = a16.row_key) 
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_keyword_c a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
join ldb.d_calendar_month a17 
on (a12.month_start_date_key = a17.row_key) 
union
select 'ldb.d_internal_contact_mdm a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_keyword_c a11 
join ldb.d_internal_contact a13 
on (a11.employee_key = a13.row_key) 
join ldb.d_internal_contact_mdm a18 
on (a13.employee_mdm_key = a18.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_service_request_keyword_c a11 
join ldb.d_calendar_date_fiscal a15 
on (a11.fiscal_date_key = a15.row_key) 
join ldb.d_calendar_fiscal_quarter a19 
on (a15.quarter_start_date_key = a19.row_key) 