select 'ldb.f_change_request_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
union
select 'ldb.d_internal_organization_legalentity a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_legalentity a12 
on (a11.company_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a14 
on (a11.closed_on_key = a14.row_key) 
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a14 
on (a11.closed_on_key = a14.row_key) 
join ldb.d_calendar_month a15 
on (a14.month_start_date_key = a15.row_key) 