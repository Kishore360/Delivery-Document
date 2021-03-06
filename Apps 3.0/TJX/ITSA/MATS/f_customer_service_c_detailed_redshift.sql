select 'ldb.f_customer_service_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_internal_contact a12 
on (a11.cs_representative_c_key = a12.row_key) 
union
select 'ldb.d_customer_service_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_customer_service_c a13 ON  a11.customer_service_c_key=a13.row_key
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_location a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_location a15 
on (a11.location_c_key = a15.row_key) 
union
select 'ldb.d_calendar_week a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_week a16 
on (a14.week_start_date_key = a16.row_key) 
union
select 'ldb.d_calendar_year a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_year a17 
on (a14.year_start_date_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_lov_customer_service_ca_feedback_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_lov_customer_service_ca_feedback_c a19 
on (a11.ca_feedback_c_key = a19.row_key) 
union
select 'ldb.d_lov_customer_service_ca_standards_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_lov_customer_service_ca_standards_c a110 
on (a11.ca_standards_c_key = a110.row_key) 
union
select 'ldb.d_lov_customer_service_category_us_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_lov_customer_service_category_us_c a111 
on (a11.category_us_c_key = a111.row_key) 
union
select 'ldb.d_lov_customer_service_u_category_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_lov_customer_service_u_category_c a112 
on (a11.customer_service_category_c_key = a112.row_key) 
union
select 'ldb.d_internal_organization_legalentity a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_internal_organization_legalentity a113 
on (a11.business_group_c_key = a113.row_key) 
union
select 'ldb.d_internal_contact_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_internal_contact a12 
on (a11.cs_representative_c_key = a12.row_key) 
join ldb.d_internal_contact_mdm a114 
on (a12.row_current_key = a114.row_current_key) 
union
select 'ldb.d_lov_customer_service_social_source_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_lov_customer_service_social_source_c a115 
on (a11.social_source_c_key = a115.row_key) 
union
select 'ldb.d_lov_customer_service_state_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_lov_customer_service_state_c a116 
on (a11.state_customer_source_c_key = a116.row_key) 
union
select 'ldb.d_lov_customer_service_subcategory_us_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_lov_customer_service_subcategory_us_c a117 
on (a11.subcategory_c_key = a117.row_key) 
union
select 'ldb.d_lov_customer_service_type_us_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_lov_customer_service_type_us_c a118 
on (a11.type_us_c_key = a118.row_key) 
union
select 'ldb.d_lov_customer_service_type_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_lov_customer_service_type_c a119 
on (a11.type_c_key = a119.row_key) 
union
select 'ldb.d_calendar_month a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a120 
on (a14.month_start_date_key = a120.row_key) 
union
select 'ldb.d_lov_customer_service_closed_code_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_lov_customer_service_closed_code_c a117 
on (a11.closed_code_c_key = a117.row_key) 
union
select 'ldb.d_lov_customer_service_source_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_customer_service_c a11 
join ldb.d_lov_customer_service_source_c a117 
on (a11.source_c_key  = a117.row_key) 

