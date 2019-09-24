select 'ldb.f_incident_outage	a11 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
union
select 'ldb.d_incident	a123 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_incident	a123 
on (a11.incident_key = a123.row_key) 
union
select 'ldb.d_application	a115 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_application	a115 
on (a11.application_key= a115.row_key) 
union
select 'ldb.d_change_request_caused_by	a122 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_application	a115 
on (a11.application_key= a115.row_key) 
join	ldb.d_change_request_caused_by	a122 
on (a115.tier_src_key= a122.row_key) 
union
select 'ldb.d_configuration_item a116 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_application	a115 
on (a11.application_key= a115.row_key) join	ldb.d_change_request_caused_by	a122 
on (a115.tier_src_key= a122.row_key) 
join ldb.d_configuration_item a116 
on (a122.configuration_item_key=a116.row_key) 
union
select 'ldb.d_lov_incident_sub_status_c	a144 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_incident	a123 
on (a11.incident_key = a123.row_key) 
join	ldb.d_lov_incident_sub_status_c	a144 
on (a123.sub_status_src_c_key = a144.row_key) 
union
select 'ldb.d_calendar_date	a12 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_calendar_date	a12 
on (a11.start_on_key = a12.row_key) 
union
select 'ldb.d_calendar_year	a163 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_calendar_date	a12 
on (a11.start_on_key = a12.row_key) 
join	ldb.d_calendar_year	a163 
on (a12.year_start_date_key = a163.row_key) 
union
select 'ldb.d_outage	a13 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_outage	a13 
on (a11.outage_key = a13.row_key) 
union
select 'ldb.d_outage_type	a14 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_outage	a13 
on (a11.outage_key = a13.row_key) 
join	ldb.d_outage_type	a14 
on (a13.outage_type_src_key = a14.row_key) 
union
select 'ldb.d_business_service	a121 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_business_service	a121 
on (a11.business_service_key = a121.row_key) 
union
select 'ldb.d_business_service_criticality	a131 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_business_service	a121 
on (a11.business_service_key = a121.row_key) 
join	ldb.d_business_service_criticality	a131 
on (a121.criticality_key = a131.row_key) 
union
select 'ldb.d_internal_contact_director_c	a117 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_application	a115 
on (a11.application_key= a115.row_key) join	ldb.d_change_request_caused_by	a122 
on (a115.tier_src_key= a122.row_key) join ldb.d_configuration_item a116 
on (a122.configuration_item_key=a116.row_key) 
join	ldb.d_internal_contact_director_c	a117 
on (a116.support_director_c_key = a117.row_key) 
union
select 'ldb.d_internal_contact_manager_c	a118 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_application	a115 
on (a11.application_key= a115.row_key) join	ldb.d_change_request_caused_by	a122 
on (a115.tier_src_key= a122.row_key) join ldb.d_configuration_item a116 
on (a122.configuration_item_key=a116.row_key) 
join	ldb.d_internal_contact_manager_c	a118 
on (a116.managed_by_c_key = a118.row_key) 
union
select 'ldb.d_internal_contact_vp_c	a119 ' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_application	a115 
on (a11.application_key= a115.row_key) join	ldb.d_change_request_caused_by	a122 
on (a115.tier_src_key= a122.row_key) join ldb.d_configuration_item a116 
on (a122.configuration_item_key=a116.row_key) 
join	ldb.d_internal_contact_vp_c	a119 
on (a116.vp_c_key = a119.row_key) 
union
select 'ldb.d_calendar_date_critical_day_c	a124	' as Table_name, count(1) Row_Count
from ldb.f_incident_outage	a11 
join	ldb.d_application	a115 
on (a11.application_key= a115.row_key) join	ldb.d_change_request_caused_by	a122 
on (a115.tier_src_key= a122.row_key) 
join	ldb.d_calendar_date_critical_day_c	a124	
on (a122.scope_src_key = a124.row_key) 