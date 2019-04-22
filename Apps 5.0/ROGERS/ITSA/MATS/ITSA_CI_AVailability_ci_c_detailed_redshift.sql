select 'ldb.f_application_availability_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
union
select 'ldb.d_application_schedule_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_application_schedule_c a12 
on (a11.application_schedule_c_key = a12.row_key) 
union
select 'ldb.d_incident a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_calendar_date a14 
on (a11.avail_start_on_c_key = a14.row_key) 
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_calendar_date a14 
on (a11.avail_start_on_c_key = a14.row_key) 
join ldb.d_calendar_month a15 
on (a14.month_start_date_key = a15.row_key) 

union
select 'ldb.d_business_application_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join	ldb.d_business_application_c	a12
	  on 	(a11.business_application_c_key = a12.row_key)
	  union
select 'ldb.d_outage_type_app_avail_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 	  
	  join	ldb.d_outage_type_app_avail_c	a111
	  on 	(a11.outage_type_src_key = a111.row_key)
	  
	  
	  union
select 'ldb.d_internal_contact_portfolio_owner_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join	ldb.d_application_schedule_c	a12
	  on 	(a11.application_schedule_c_key = a12.row_key)
	join	ldb.d_internal_contact_portfolio_owner_c	a112
	  on 	(a12.portfolio_owner_c_key = a112.row_key)
	  
	  union
select 'ldb.d_internal_contact_technical_owner_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join	ldb.d_application_schedule_c	a12
	  on 	(a11.application_schedule_c_key = a12.row_key)
	join	ldb.d_internal_contact_technical_owner_c	a113
	  on 	(a12.technical_owner_c_key = a113.row_key)
	  union
	  select 'ldb.d_internal_contact_supported_by_app_avail_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join	ldb.d_business_application_c	a12
	  on 	(a11.business_application_c_key = a12.row_key)
	join	ldb.d_internal_contact_supported_by_app_avail_c	a114
	  on 	(a12.supported_by_c_key = a114.row_key)
	  
	  union
	  select 'ldb.d_lov_business_application_environment_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join	ldb.d_business_application_c	a12
	  on 	(a11.business_application_c_key = a12.row_key)
	join	ldb.d_lov_business_application_environment_c	a115
	  on 	(a12.business_application_environment_c_key = a115.row_key)
	  
	    
	  union
	  select 'ldb.d_lov_business_application_operational_status_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join	ldb.d_business_application_c	a12
	  on 	(a11.business_application_c_key = a12.row_key)
	join	ldb.d_lov_business_application_operational_status_c	a116
	  on 	(a12.operational_status_business_src_c_key = a116.row_key)
	
	
	
	  union
	  select 'ldb.d_internal_contact_owned_by_app_avail_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join	ldb.d_business_application_c	a12
	  on 	(a11.business_application_c_key = a12.row_key)
	join	ldb.d_internal_contact_owned_by_app_avail_c	a117
	  on 	(a12.owned_by_c_key = a117.row_key)
	  
	  
	  
	  union
	  select 'ldb.d_lov_business_application_type_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join	ldb.d_business_application_c	a12
	  on 	(a11.business_application_c_key = a12.row_key)
	join	ldb.d_lov_business_application_type_c	a118
	  on 	(a12.type_src_key = a118.row_key)