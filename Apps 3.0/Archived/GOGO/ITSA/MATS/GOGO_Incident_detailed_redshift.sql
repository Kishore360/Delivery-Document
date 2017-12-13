select 'f_incident'as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident	a11

union

select  'd_duplicate_incident_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident	a11
   join        ldb.d_duplicate_incident_c	a12
   on       	(a11.duplicate_incident_c_key = a12.row_key)

union

select  'd_incident_it_business_service_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident	a11
   join        ldb.d_incident_it_business_service_c	a12
   on       	(a11.it_business_service_c_key = a12.row_key)

union

select  'd_incident_it_provider_service_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident	a11
   join        ldb.d_incident_it_provider_service_c	a12
   on       	(a11.it_provider_service_c_key = a12.row_key)

union

select  'd_incident_notify_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident	a11
   join        ldb.d_incident_notify_c	a12
   on       	(a11.notify_src_c_key = a12.row_key)

union

select  'd_incident_on_hold_reason_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident	a11
   join        ldb.d_incident_on_hold_reason_c	a12
   on       	(a11.on_hold_reason_src_c_key = a12.row_key)
   
union

select  'd_internal_contact_opened_by_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident	a11
   join        ldb.d_internal_contact_opened_by_c	a12
   on       	(a11.opened_by_c_key = a12.row_key)
   
   
   union

select  'd_incident_level_1_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident	a11
   join        ldb.d_incident_level_1_c	a12
   on       	(a11.level_1_src_c_key = a12.row_key)

union

select  'd_incident_level_2_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident	a11
   join        ldb.d_incident_level_2_c	a12
   on       	(a11.level_2_src_c_key = a12.row_key)
   
union

select  'd_incident_level_3_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident	a11
   join        ldb.d_incident_level_3_c	a12
   on       	(a11.level_3_src_c_key = a12.row_key)
   
   union
   select  'd_incident_airline_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident	a11
   join        ldb.d_incident_airline_c	a12
   on       	(a11.airline_src_c_key = a12.row_key)