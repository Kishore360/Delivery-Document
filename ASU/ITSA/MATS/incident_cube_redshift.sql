SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'Cust columns has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
 
select  'd_incident_category1_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
		join	ldb.d_incident_category1_c	c100
	  on 	(a11.category_1_src_c_key = c100.row_key)

union

select  'd_incident_category2_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
		join	ldb.d_incident_category1_c	c101
	  on 	(a11.category_2_src_c_key = c101.row_key)


union

select  'd_incident_category_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
		join	ldb.d_incident_category1_c	c102
	  on 	(a11.category_src_c_key = c102.row_key)
union

select  'd_location_impacted_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
		join	ldb.d_location_impacted_c	a18
	  on 	(a11.locations_impacted_c_key = a18.row_key)

union

select  'd_internal_contact_requester_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
		join	ldb.d_internal_contact_requester_c	a110
	  on 	(a11.requester_c_key = a110.row_key)
	  )a
)b