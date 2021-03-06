select 'ldb.f_request_task_closed_c a11 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_closed_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_closed_c a11 
join ldb.d_calendar_date a12 
on (a11.closed_on_key = a12.row_key) 
union
	select 'ldb.d_calendar_date_fiscal a11 ' as Table_name, count(1) Row_Count									
from ldb.f_request_task_closed_c a11 
 join          ldb.d_calendar_date_fiscal    a14
                  on          (a11.closed_on_key = a14.row_key)	
union
select 'ldb.d_calendar_fiscal_quarter a11 ' as Table_name, count(1) Row_Count									
from ldb.f_request_task_closed_c a11 
 join          ldb.d_calendar_date_fiscal    a14
                  on          (a11.closed_on_key = a14.row_key)	
 join          ldb.d_calendar_fiscal_quarter               a115
                  on          (a14.quarter_start_date_key = a115.row_key)	
union
	select 'ldb.d_calendar_fiscal_year a11 ' as Table_name, count(1) Row_Count									
from ldb.f_request_task_closed_c a11 
 join          ldb.d_calendar_date_fiscal    a14
                  on          (a11.closed_on_key = a14.row_key)	
 join          ldb.d_calendar_fiscal_year               a115
                  on          (a14.year_start_date_key = a115.row_key)				  

