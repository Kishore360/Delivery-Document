SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (

select 'ldb.f_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
union

select  			'd_internal_organization_legalentity_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 
left outer join		ldb.d_internal_organization_legalentity_incident_c	a12
on 					(a11.incident_company_key = a12.row_key)
union

select  			'd_internal_organization_department' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 
left outer join		ldb.d_internal_organization_department	a13
on 					(a11.opened_by_department_key = a13.row_key)
union

select  			'd_internal_organization_department_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 
left outer join		ldb.d_internal_organization_department_incident_c	a14
on 					(a11.incident_opened_by_department_key = a14.row_key)
union

select  			'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 
left outer join		ldb.d_internal_contact	a15
on 					(a11.opened_by_key = a15.row_key)
union

select  			'd_internal_contact_incident_c' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 
left outer join		ldb.d_internal_contact_incident_c	a16
on 					(a11.incident_opened_by_key = a16.row_key)
union

select  			'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 
left outer join		ldb.d_calendar_date	a17
on 					(a11.opened_on_key = a17.row_key)
union

select  			'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count 
from 				ldb.f_incident_task_c a11 
left outer join		ldb.d_calendar_date	a17
on 					(a11.opened_on_key = a17.row_key)
left outer join		ldb.d_calendar_month	a18
on 					(a17.month_start_date_key = a18.row_key)
)a
)b