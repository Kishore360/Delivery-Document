select 'ldb.f_incident  a11' as table_name,count(a11.row_key) Row_Count
from ldb.f_incident  a11
union
select 'ldb.d_calendar_date  a12' as table_name, count(a11.row_key) Row_Count
from ldb.f_incident  a11
join ldb.d_calendar_date  a12
on (a11.date_key = a12.row_key)
union
select 'ldb.d_customer  a13' as table_name, count(a11.row_key) Row_Count
from ldb.f_incident  a11
join ldb.d_customer  a13
on (a11.customer_key = a13.row_key)
union
select 'ldb.d_incident  a14' as table_name, count(a11.row_key) Row_Count
from ldb.f_incident  a11
join ldb.d_incident  a14
on (a11.incident_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15' as table_name, count(a11.row_key) Row_Count
from ldb.f_incident  a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_configuration_item  a16' as table_name, count(a11.row_key) Row_Count
from ldb.f_incident  a11
join ldb.d_configuration_item  a16
on (a11.configuration_item_key = a16.row_key)
union
select 'ldb.d_incident_priority   a17' as table_name, count(a11.row_key) Row_Count
from ldb.f_incident  a11
join ldb.d_incident   a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_priority   a17
on (a14.priority_src_key = a17.row_key)
union
select 'ldb.d_internal_contact_assigned_to  a18' as table_name, count(a11.row_key) Row_Count
from ldb.f_incident  a11
join ldb.d_internal_contact_assigned_to  a18
on (a11.assigned_to_key = a18.row_key)
union
select 'ldb.d_calendar_week a19' as table_name, count(a11.row_key) Row_Count
from ldb.f_incident  a11
 join ldb.d_calendar_date  a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_week a19
on (a12.week_start_date_key = a19.row_key)
union
select 'ldb.d_customer_mdm    a110' as table_name, count(a11.row_key) Row_Count
from ldb.f_incident  a11
join ldb.d_customer  a13
on (a11.customer_key = a13.row_key)
join ldb.d_customer_mdm    a110
on (a13.customer_mdm_key = a110.row_key)
union
select ' ldb.d_domain  a111' as table_name, count(a11.row_key) Row_Count
from ldb.f_incident  a11
join ldb.d_domain  a111
on   (a11.domain_key = a111.row_key)
union
select 'ldb.d_incident_category  a112' as table_name, count(a11.row_key)Row_Count
from ldb.f_incident  a11
join ldb.d_incident  a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_category  a112
on (a14.category_src_key = a112.row_key)
union
select 'ldb.d_incident_state  a113' as table_name, Count(a11.row_key)Row_Count
from ldb.f_incident  a11
 join ldb.d_incident  a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_state  a113
on (a14.state_src_key = a113.row_key)
union
select 'ldb.d_incident_subcategory   a114' as table_name, Count(a11.row_key) Row_Count
from ldb.f_incident  a11
 join ldb.d_incident  a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_subcategory   a114
on (a14.sub_category_src_key = a114.row_key)
union
select 'ldb.d_calendar_month   a115' as table_name, Count(a11.row_key)Row_Count
from ldb.f_incident  a11
join ldb.d_calendar_date  a12
on (a11.date_key = a12.row_key)
join   ldb.d_calendar_month  a115
on (a12.month_start_date_key = a115.row_key)



