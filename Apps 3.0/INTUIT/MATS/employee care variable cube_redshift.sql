SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (

select 'f_request_item' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_request_item	    a11
union
	select  'd_request_item_variable_comments' as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item a11 join 	ldb.d_request_item_variable_comments	a16
	  on 	(a11.request_item_key = a16.row_key)union
	select  'd_request_item_variable_hardware' as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item a11 join 	ldb.d_request_item_variable_hardware	a17
	  on 	(a11.request_item_key = a17.row_key)union
	select  'd_request_item_variable_location' as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item a11 join 	ldb.d_request_item_variable_location	a18
	  on 	(a11.request_item_key = a18.row_key)union
	select  'd_request_item_variable_software' as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item a11 join 	ldb.d_request_item_variable_software	a110
	  on 	(a11.request_item_key = a110.row_key)union
	select  'd_request_item_variable_start_date' as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item a11 join 	ldb.d_request_item_variable_start_date	a111
	  on 	(a11.request_item_key = a111.row_key)union
	select  'd_party_new_hire' as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item a11 join 	ldb.d_party_new_hire	a115
	  on 	(a11.new_hire_c_key = a115.row_key)union
	select  'd_party_preparer' as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item a11 join 	ldb.d_party_preparer	a116
	  on 	(a11.requested_for_c_key = a116.row_key)union
	select  'd_request' as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item a11 join 	
ldb.d_request	a117
	  on 	(a11.request_key = a117.row_key)
)a
)b