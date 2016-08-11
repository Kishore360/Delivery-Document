SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (

select 'f_change_request_closed'as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11

union

select  'd_internal_organization_department' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_internal_organization_department	a12
   on       	(a11.requested_by_department_key = a12.row_key)

union

select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_internal_contact	a13
   on       	(a11.opened_by_key = a13.row_key)

union

select  'd_change_request_state' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_change_request_state	a14
   on       	(a11.state_src_key = a14.row_key)

union

select  'd_change_request' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_change_request	a15
   on       	(a11.change_request_key = a15.row_key)

union

select  'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_calendar_date	a16
   on       	(a11.opened_on_key = a16.row_key)

union

select  'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_calendar_date	a17
	  on 	(a11.opened_on_key = a17.row_key)
	join	ldb.d_calendar_month	a18
	  on 	(a17.month_start_date_key = a18.row_key)


)a
)b

