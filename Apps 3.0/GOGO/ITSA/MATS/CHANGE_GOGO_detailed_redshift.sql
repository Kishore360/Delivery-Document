select 'f_change_request_closed'as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11

union

select  'd_change_it_provider_service_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_change_it_provider_service_c	a12
   on       	(a11.it_provider_service_c_key = a12.row_key)

union

select  'd_change_request_closure_code_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_change_request_closure_code_c	a13
   on       	(a11.closure_code_src_c_key = a13.row_key)

union

select  'd_change_request_implementation_code_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_change_request_implementation_code_c	a14
   on       	(a11.implementation_code_src_c_key = a14.row_key)

union

select  'd_change_request_level_1_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request 	a11
   join        ldb.d_change_request_level_1_c	a15
   on       	(a11.level_1_src_c_key = a15.row_key)
union

select  'd_change_request_level_2_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_change_request_level_2_c	a15
   on       	(a11.level_2_src_c_key = a15.row_key)
   union

select  'd_change_request_level_3_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_change_request_level_3_c	a15
   on       	(a11.level_3_src_c_key = a15.row_key)
union

select  'd_change_request_outage_anticipated_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_change_request_outage_anticipated_c	a16
   on       	(a11.outage_anticipated_src_c_key = a16.row_key)

union

select  'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_change_request_source_c	a17
	  on 	(a11.source_src_c_key = a17.row_key)
	  
union

select  'd_change_request_submission_priority_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_change_request_submission_priority_c	a17
	  on 	(a11.submission_priority_src_c_key = a17.row_key)
	  
	  union

select  'd_change_request_submission_priority_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_outage_incident_c	a17
	  on 	(a11.outage_incident_c_key = a17.row_key)
	  	  union

select  'd_resulting_problem_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_request	a11
   join        ldb.d_resulting_problem_c	a17
	  on 	(a11.resulting_problem_c_key = a17.row_key)


