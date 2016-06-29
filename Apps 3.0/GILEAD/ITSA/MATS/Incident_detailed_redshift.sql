
select'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 

union
select 'ldb.d_internal_contact_opened_by_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_internal_contact_opened_by_c       a12
on (a11.opened_by_c_key =a12.row_key)


union
select 'ldb.d_location_site_c ' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join        ldb.d_location   a14
on         (a11.location_key = a14.row_key)
join ldb.d_location_site_c        a12
on (a14.site_c_key =a12.row_key)

union
select 'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_internal_organization_legalentity       a12
on (a11.company_key=a12.row_key)
union
select 'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_customer       a13
on (a11.customer_key=a13.row_key)
union
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_internal_contact       a14
on (a11.opened_by_key=a14.row_key)
union
select 'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_calendar_time       a15
on (a11.opened_time_key=a15.row_key)
union
select 'ldb.dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.dh_assignment_group_tier_hierarchy       a16
on (a11.assignment_group_key=a16.user_group_tier_key)
union
select 'ldb.dh_assignment_group_type_hierarchy' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.dh_assignment_group_type_hierarchy       a17
on (a11.assignment_group_key=a17.user_group_type_key)
union
select 'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_incident       a18
on (a11.incident_key=a18.row_key)
union
select 'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_configuration_item       a19
on (a11.configuration_item_key=a19.row_key)
union
select 'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_calendar_date       a110
on (a11.opened_on_key=a110.row_key)
union
select 'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_calendar_date       a110
on (a11.opened_on_key=a110.row_key)
join ldb.d_calendar_week      a1100
on (a110.week_start_date_key=a1100.row_key)
union
select 'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_calendar_date       a110
on (a11.opened_on_key=a110.row_key)
join ldb.d_calendar_year      a1100
on (a110.year_start_date_key =a1100.row_key)

union
select 'ldb.d_application_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_application_c       a111
on (a11.application_c_key=a111.row_key)
union
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_internal_contact       a112
on (a11.assigned_to_key=a112.row_key)
union
select 'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_internal_contact_assigned_to       a112
on (a11.assigned_to_key=a112.row_key)
union
select 'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_internal_organization_group       a113
on (a11.assignment_group_key=a113.row_key)
union
select 'ldb.d_business_service_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_business_service_c       a114
on (a11.business_service_c_key=a114.row_key)
union
select 'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 join ldb.d_customer	       a13	on (a11.customer_key=a13.row_key)
join ldb.d_customer_mdm       a115
on (a13.row_current_key=a115.row_current_key)
union
select 'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_internal_organization_department       a116
on (a11.opened_by_department_key=a116.row_key)
union
select 'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_domain       a117
on (a11.domain_key=a117.row_key)
union
select 'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 join ldb.d_internal_contact	       a14	on (a11.opened_by_key=a14.row_key)
join ldb.d_internal_contact_mdm       a118
on (a14.row_current_key=a118.row_current_key)
union
select 'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 join ldb.d_calendar_time	       a15	on (a11.opened_time_key=a15.row_key)
join ldb.d_calendar_time_hour       a119
on (a15.hour_24_format_num=a119.hour_24_format_num)
union
select 'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_incident_category       a120
on (a11.category_src_key=a120.row_key)
union
select 'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_incident_close_code       a121
on (a11.close_code_src_key=a121.row_key)
union
select 'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_incident_severity       a122
on (a11.severity_src_key=a122.row_key)
union
select 'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_incident_state       a123
on (a11.state_src_key=a123.row_key)
union
select 'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_incident_subcategory       a124
on (a11.sub_category_src_key=a124.row_key)
union
select 'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_task_impact       a125
on (a11.impact_src_key=a125.row_key)
union
select 'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_location       a126
on (a11.location_key=a126.row_key)
union
select 'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_task_priority       a127
on (a11.priority_src_key=a127.row_key)
union
select 'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_task_contacttype       a128
on (a11.reported_type_src_key=a128.row_key)
union
select 'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_task_urgency       a129
on (a11.urgency_src_key=a129.row_key)
union
select 'ldb.d_technical_service_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_technical_service_c       a130
on (a11.technical_service_c_key=a130.row_key)
union
select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 join ldb.d_calendar_date	       a110	on (a11.opened_on_key=a110.row_key)
join ldb.d_calendar_month       a131
on (a110.month_start_date_key=a131.row_key)
   union
   
select  'd_internal_organization_escalation_gp_c' as Table_Name,count(a11.row_key) Row_Count   
   from ldb.f_incident a11
 join ldb.d_internal_organization_group a12
   on  (a11.assignment_group_key = a12.row_key)
 join ldb.d_internal_organization_escalation_gp_c a13
   on  (a12.escalation_group_c_key = a13.row_key)
   
   union
 select  'd_configuration_item_causing_ci_c' as Table_Name,count(a11.row_key) Row_Count     
   from ldb.f_incident a11
 join ldb.d_configuration_item_causing_ci_c a12
   on  (a11.causing_ci_c_key = a12.row_key)
   
   union
  select  'd_internal_contact_owner_c' as Table_Name,count(a11.row_key) Row_Count     
   from ldb.f_incident a11
 join ldb.d_internal_organization_group a12
   on  (a11.assignment_group_key = a12.row_key)
 join ldb.d_internal_contact_owner_c a13
   on  (a12.owner_c_key = a13.row_key)