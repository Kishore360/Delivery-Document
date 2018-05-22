select 'ldb.f_service_request_resolved_c  a11 ' as Table_name, count(1) Row_Count
from ldb.f_service_request_resolved_c  a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(1) Row_Count
from ldb.f_service_request_resolved_c  a11 
join ldb.d_calendar_date a12 
on (a11.last_resolved_on_key = a12.row_key) 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(1) Row_Count
from ldb.f_service_request_resolved_c  a11 
join ldb.d_internal_contact a12 
on (a11.last_resolved_by_key = a12.row_key)
union
select 'ldb.d_calendar_date_fiscal a11 ' as Table_name, count(1) Row_Count											
from ldb.f_service_request_resolved_c a11 
join          ldb.d_calendar_date_fiscal    a14
                  on          (a11.last_resolved_on_key = a14.row_key)
				  union
		select 'ldb.d_calendar_fiscal_quarter a11 ' as Table_name, count(1) Row_Count											
from ldb.f_service_request_resolved_c a11 
join          ldb.d_calendar_date_fiscal    a14
                  on          (a11.last_resolved_on_key = a14.row_key)
join          ldb.d_calendar_fiscal_quarter               a117
                  on          (a14.quarter_start_date_key = a117.row_key)	
		  union
		select 'ldb.d_calendar_fiscal_year a11 ' as Table_name, count(1) Row_Count											
from ldb.f_service_request_resolved_c a11 
join          ldb.d_calendar_date_fiscal    a14
                  on          (a11.last_resolved_on_key = a14.row_key)
join          ldb.d_calendar_fiscal_year               a117
                  on          (a14.year_start_date_key = a117.row_key)
                  