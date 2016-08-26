select 'f_incident_resolved'as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_resolved	a11

union

select  'd_internal_organization_legalentity' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_resolved	a11
   join        ldb.d_internal_organization_legalentity	a12
   on       	(a11.company_key = a12.row_key)

union

select  'd_customer' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_resolved	a11
   join        ldb.d_customer	a12
   on       	(a11.customer_key = a12.row_key)

union

select  'd_internal_organization_department' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_resolved	a11
   join        ldb.d_internal_organization_department	a12
   on       	(a11.opened_by_department_key = a12.row_key)

union

select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_resolved	a11
   join        ldb.d_internal_contact	a12
   on       	(a11.opened_by_key = a12.row_key)

union

select  'd_calendar_time' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_resolved	a11
   join        ldb.d_calendar_time	a12
   on       	(a11.opened_time_key = a12.row_key)