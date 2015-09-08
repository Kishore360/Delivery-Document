SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (

select  'f_facility_request' as Table_Name,count(a11.row_key) Row_Count
from      ldb.f_facility_request a11

UNION

select  'd_internal_organization_department' as Table_Name,count(a11.row_key) Row_Count
from      ldb.f_facility_request a11
join	ldb.d_internal_organization_department	a12
	  on 	(a11.opened_by_department_key = a12.row_key)

UNION

select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count
from      ldb.f_facility_request a11
join	ldb.d_internal_contact	a13
	  on 	(a11.opened_by_key = a13.row_key)

UNION

select  'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count
from      ldb.f_facility_request a11
join	ldb.d_calendar_date	a14
	  on 	(a11.opened_on_key = a14.row_key)

UNION

select  'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count
from      ldb.f_facility_request a11
join	ldb.d_calendar_date	a14
	  on 	(a11.opened_on_key = a14.row_key)
join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)

UNION

select  'd_task_state' as Table_Name,count(a11.row_key) Row_Count
from      ldb.f_facility_request a11
join	ldb.d_task_state	a16
on 	(a11.state_src_key = a16.row_key)

UNION

select  'd_task_impact' as Table_Name,count(a11.row_key) Row_Count
from      ldb.f_facility_request a11
join	ldb.d_task_impact	a17
	  on 	(a11.impact_src_key = a17.row_key)

UNION	  

select  'd_facility_request' as Table_Name,count(a11.row_key) Row_Count
from    ldb.f_facility_request a11	  
join	ldb.d_facility_request	a19
on 	(a11.facility_request_key = a19.row_key)

UNION	  

select  'd_task_urgency' as Table_Name,count(a11.row_key) Row_Count
from    ldb.f_facility_request a11	  
join	ldb.d_task_urgency	a119
on 	(a11.urgency_src_key = a119.row_key)

UNION	  

select  'd_task_priority' as Table_Name,count(a11.row_key) Row_Count
from    ldb.f_facility_request a11	  
join	ldb.d_task_priority	a129
on 	(a11.priority_src_key = a129.row_key)

UNION	  

select  'd_task_contacttype' as Table_Name,count(a11.row_key) Row_Count
from    ldb.f_facility_request a11	  
join	ldb.d_task_contacttype	a119
on 	(a11.reported_type_src_key = a119.row_key)
)a
)b