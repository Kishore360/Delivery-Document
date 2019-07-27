select 'ldb.f_incident_keyword' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
union
select 'ldb.d_customer' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_customer  a12 on (a11.customer_key=a12.row_key)
union
select 'ldb.d_internal_contact' as Table_Name, count(1) Row_Count
from ldb.f_incident_keyword  a11 
join ldb.d_internal_contact  a13 on (a11.employee_key=a13.row_key)
union
select 'ldb.d_calendar_time' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_calendar_time  a14 on (a11.time_key=a14.row_key)
UNION 
select 'ldb.d_internal_contact_assigned_to' as Table_Name, count(1) Row_Count
from ldb.f_incident_keyword  a11 
join ldb.d_internal_contact_assigned_to  a15 on (a11.assigned_to_key=a15.row_key)
union
select 'ldb.d_internal_organization_group' as Table_Name, count(1) Row_Count
from ldb.f_incident_keyword  a11 
join ldb.d_internal_organization_group  a16 on (a11.assignment_group_key=a16.row_key)
union
select 'ldb.d_calendar_date' as Table_Name, count(1) Row_Count
from ldb.f_incident_keyword  a11 
join ldb.d_calendar_date  a17 on (a11.date_key=a17.row_key)
union
select 'ldb.d_calendar_month' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_calendar_date  a17 on (a11.date_key=a17.row_key)
join ldb.d_calendar_month  a18 on (a17.month_start_date_key=a18.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_calendar_date  a17 on (a11.date_key=a17.row_key)
join ldb.d_calendar_month  a18 on (a17.month_start_date_key=a18.row_key)
join ldb.d_calendar_quarter  a19 on (a18.quarter_start_date_key=a19.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_configuration_item  a110 on (a11.configuration_item_key=a110.row_key)
UNION 
select 'ldb.d_internal_contact_mdm' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_internal_contact  a13 on (a11.employee_key=a13.row_key)
join ldb.d_internal_contact_mdm  a111 on (a13.employee_mdm_key=a111.row_key)
union
select'ldb.d_incident' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_incident  a112 on (a11.table_row_key=a112.row_key)
union
select'ldb.d_parent_incident' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
 join ldb.d_incident  a112 on (a11.table_row_key=a112.row_key)
join ldb.d_parent_incident  a113 on (a112.parent_incident_key=a113.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_internal_organization_legalentity  a114 on (a11.company_key=a114.row_key)
union
select'ldb.d_customer_mdm' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
 join ldb.d_customer  a12 on (a11.customer_key=a12.row_key)
join ldb.d_customer_mdm  a115 on (a12.customer_mdm_key=a115.row_key)
union
select'ldb.d_domain' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_domain  a116 on (a11.domain_key=a116.row_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_calendar_time  a14 on (a11.time_key=a14.row_key)
join ldb.d_calendar_time_hour  a117 on (a14.hour_key=a117.row_key)
UNION 
select'ldb.d_incident_contacttype' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_incident_contacttype  a118 on (a11.incident_reported_type_src_key=a118.row_key)
union
select'ldb.d_incident_impact' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_incident_impact  a119 on (a11.incident_impact_src_key=a119.row_key)
union
select 'ldb.d_incident_urgency' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_incident_urgency  a120 on (a11.incident_urgency_src_key=a120.row_key)
union
select'ldb.d_location' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_location  a121 on (a11.location_key=a121.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11
join ldb.d_calendar_date  a17 on (a11.date_key=a17.row_key)
join ldb.d_calendar_week  a122 on (a17.week_start_date_key=a122.row_key)
union
select 'ldb.d_employee_location' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_internal_contact  a13 on (a11.employee_key=a13.row_key)
join ldb.d_internal_contact_mdm  a111 on (a13.employee_mdm_key=a111.row_key)
join ldb.d_employee_location  a123 on (a111.location_key=a123.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_incident_category  a124 on (a11.incident_category_src_key=a124.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_incident_close_code  a125 on (a11.close_code_src_key=a125.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_incident_priority  a126 on (a11.incident_priority_src_key=a126.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_incident_severity  a127 on (a11.incident_severity_src_key=a127.row_key)
union
select 'ldb.d_incident_state' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_incident_state  a128 on (a11.incident_state_src_key=a128.row_key)
union
select 'ldb.d_customer' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_customer  a12 on (a11.customer_key=a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(1) Row_Count
from  ldb.f_incident_keyword  a11 
join ldb.d_internal_contact  a13 on (a11.employee_key=a13.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_calendar_time  a14
on (a11.time_key=a14.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_internal_contact_assigned_to  a15
on (a11.assigned_to_key=a15.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_internal_organization_group  a16
on (a11.assignment_group_key=a16.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_calendar_date  a17
on (a11.date_key=a17.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
 join ldb.d_calendar_date  a17
on (a11.date_key=a17.row_key)
join ldb.d_calendar_month  a18
on (a17.month_start_date_key=a18.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
  join ldb.d_calendar_date  a17
on (a11.date_key=a17.row_key)
join ldb.d_calendar_month  a18
on (a17.month_start_date_key=a18.row_key)
join ldb.d_calendar_quarter  a19
on (a18.quarter_start_date_key=a19.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_configuration_item  a110
on (a11.configuration_item_key=a110.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
 join ldb.d_internal_contact  a13
on (a11.employee_key=a13.row_key)
join ldb.d_internal_contact_mdm  a111
on (a13.employee_mdm_key=a111.row_key)
union
select'ldb.d_incident' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_incident  a112
on (a11.table_row_key=a112.row_key)
union
select'ldb.d_parent_incident' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
 join ldb.d_incident  a112
on (a11.table_row_key=a112.row_key)
join ldb.d_parent_incident  a113
on (a112.parent_incident_key=a113.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_internal_organization_legalentity  a114
on (a11.company_key=a114.row_key)
union
select'ldb.d_customer_mdm' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
 join ldb.d_customer  a12
on (a11.customer_key=a12.row_key)
join ldb.d_customer_mdm  a115
on (a12.customer_mdm_key=a115.row_key)
union
select'ldb.d_domain' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_domain  a116
on (a11.domain_key=a116.row_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
 join ldb.d_calendar_time  a14
on (a11.time_key=a14.row_key)
join ldb.d_calendar_time_hour  a117
on (a14.hour_key=a117.row_key)
union
select'ldb.d_incident_contacttype' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_incident_contacttype  a118
on (a11.incident_reported_type_src_key=a118.row_key)
union
select'ldb.d_incident_impact' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_incident_impact  a119
on (a11.incident_impact_src_key=a119.row_key)
union
select'ldb.d_incident_urgency' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_incident_urgency  a120
on (a11.incident_urgency_src_key=a120.row_key)
union
select'ldb.d_location' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_location  a121
on (a11.location_key=a121.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11
 join ldb.d_calendar_date  a17
on (a11.date_key=a17.row_key)
join ldb.d_calendar_week  a122
on (a17.week_start_date_key=a122.row_key)
union
select'ldb.d_employee_location' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
  join ldb.d_internal_contact  a13
on (a11.employee_key=a13.row_key)
join ldb.d_internal_contact_mdm  a111
on (a13.employee_mdm_key=a111.row_key)
join ldb.d_employee_location  a123
on (a111.location_key=a123.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_incident_category  a124
on (a11.incident_category_src_key=a124.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_incident_close_code  a125
on (a11.close_code_src_key=a125.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_incident_priority  a126
on (a11.incident_priority_src_key=a126.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_incident_severity  a127
on (a11.incident_severity_src_key=a127.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_incident_state  a128
on (a11.incident_state_src_key=a128.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
join ldb.d_incident_subcategory  a129
on (a11.incident_sub_category_src_key=a129.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword  a11 
   join ldb.d_calendar_date  a17
on (a11.date_key=a17.row_key)
join ldb.d_calendar_month  a18
on (a17.month_start_date_key=a18.row_key)
join ldb.d_calendar_quarter  a19
on (a18.quarter_start_date_key=a19.row_key)
join ldb.d_calendar_year  a130
on (a19.year_start_date_key=a130.row_key)
union
select'ldb.d_configuration_item_incident_service_offering_c' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_configuration_item_incident_service_offering_c       a12
on (a11.service_offering_c_key = a12.row_key)
union
select'ldb.d_business_service' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_business_service       a12
on (a11.business_service_c_key = a12.row_key)