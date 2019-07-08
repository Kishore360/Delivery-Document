select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
union
select 'ldb.d_customer a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a13 
on (a11.customer_key = a13.row_key) 
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_incident_priority a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
join ldb.d_incident_priority a17 
on (a14.priority_src_key = a17.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a18 
on (a11.assigned_to_key = a18.row_key) 
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
join ldb.d_calendar_month a19 
on (a12.month_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_week a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a12 
on (a11.date_key = a12.row_key) 
join ldb.d_calendar_week a110 
on (a12.week_start_date_key = a110.row_key) 
union
select 'ldb.d_customer_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a13 
on (a11.customer_key = a13.row_key) 
join ldb.d_customer_mdm a111 
on (a13.customer_mdm_key = a111.row_key) 
union
select 'ldb.d_domain a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a112 
on (a11.domain_key = a112.row_key) 
union
select 'ldb.d_category_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_category_c a113 
on (a11.category_5_c_key = a113.row_key) 
union
select 'ldb.d_incident_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
join ldb.d_incident_state a114 
on (a14.state_src_key = a114.row_key) 
union
select 'ldb.d_incident_subcategory a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
join ldb.d_incident_subcategory a115 
on (a14.sub_category_src_key = a115.row_key) 
union
select 'ldb.d_lov_incident_resolver_department_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_resolver_department_c a116 
on (a11.resolver_department_c_key = a116.row_key) 