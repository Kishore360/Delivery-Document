select 'ldb.f_configuration_item_certificates_c	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_certificates_c	a11 
union
select 'ldb.d_configuration_item	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_certificates_c	a11 
join	ldb.d_configuration_item	a12 
on (a11.row_key = a12.row_key) 
union
select 'ldb.d_calendar_date_valid_to_c	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_certificates_c	a11 
join	ldb.d_configuration_item	a12 
on (a11.row_key = a12.row_key) 
join	ldb.d_calendar_date_valid_to_c	a13 
on (a12.valid_to_c_key = a13.row_key) 
union
select 'ldb.d_calendar_month_valid_to_c	a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_certificates_c	a11 
join	ldb.d_configuration_item	a12 
on (a11.row_key = a12.row_key) join	ldb.d_calendar_date_valid_to_c	a13 
on (a12.valid_to_c_key = a13.row_key) 
join	ldb.d_calendar_month_valid_to_c	a14 
on (a13.month_start_date_key = a14.row_key) 
union
select 'ldb.d_application_event_c	a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_certificates_c	a11 
join	ldb.d_application_event_c	a15 
on (a11.application_c_key = a15.row_key) 
union
select 'ldb.d_internal_organization_configuration_item_support_group_c	a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_certificates_c	a11 
join	ldb.d_configuration_item	a12 
on (a11.row_key = a12.row_key) 
join	ldb.d_internal_organization_configuration_item_support_group_c	a16 
on (a12.support_group_c_key = a16.row_key) 
union
select 'ldb.d_internal_contact_certificate_director_c	a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_certificates_c	a11 
join	ldb.d_configuration_item	a12 
on (a11.row_key = a12.row_key) 
join	ldb.d_internal_contact_certificate_director_c	a17 
on (a12.certificate_director_c_key = a17.row_key) 
union
select 'ldb.d_internal_contact_certificate_manager_c	a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_certificates_c	a11 
join	ldb.d_configuration_item	a12 
on (a11.row_key = a12.row_key) 
join	ldb.d_internal_contact_certificate_manager_c	a18 
on (a12.certificate_manager_c_key = a18.row_key) 
union
select 'ldb.d_internal_contact_certificate_requester_c	a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_certificates_c	a11 
join	ldb.d_configuration_item	a12 
on (a11.row_key = a12.row_key) 
join	ldb.d_internal_contact_certificate_requester_c	a19 
on (a12.certificate_requester_c_key = a19.row_key) 
union
select 'ldb.d_internal_organization_company_c	a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_certificates_c	a11 
join	ldb.d_configuration_item	a12 
on (a11.row_key = a12.row_key) 
join	ldb.d_internal_organization_company_c	a110 
on (a12.company_c_key = a110.row_key) 