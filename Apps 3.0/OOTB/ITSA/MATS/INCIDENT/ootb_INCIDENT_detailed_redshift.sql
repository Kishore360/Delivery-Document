 select'f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 union
 select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
union
select'd_calendar_time' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_calendar_time         a12
on (a11.opened_time_key = a12.row_key)
union
select'd_configuration_item' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_configuration_item       a13
on (a11.configuration_item_key = a13.row_key)
union
select'd_customer' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_customer       a14
on (a11.customer_key = a14.row_key)
union
select'd_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11
join ldb.d_customer       a14
on (a11.customer_key = a14.row_key)
join ldb.d_customer_mdm      a15
on (a14.row_current_key = a15.row_current_key)
union
select'd_domain' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_domain       a16
on (a11.domain_key = a16.row_key)
union
select'd_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_incident       a17
on (a11.incident_key = a17.row_key)
union
select'd_incident_category' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_incident       a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_category       a18
on (a17.category_src_key = a18.row_key)
union
select'd_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_incident       a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_close_code       a19
on (a17.close_code_src_key = a19.row_key)
union
select'd_incident_severity' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_incident       a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_severity       a110
on (a17.severity_src_key = a110.row_key)
union
select'd_incident_state' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_incident       a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_state       a111
on (a17.state_src_key = a111.row_key)
union
select'd_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_incident       a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_subcategory       a112
on (a17.sub_category_src_key = a112.row_key)
union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_contact       a113
on (a11.opened_by_key = a113.row_key)
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11
join ldb.d_internal_contact       a113
on (a11.opened_by_key = a113.row_key)
join ldb.d_internal_contact_mdm       a114
on (a113.row_current_key = a114.row_current_key)
union
select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_organization_department       a115
on (a11.opened_by_department_key = a115.row_key)
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_organization_group       a115
on (a11.assignment_group_key = a115.row_key)
union
select'd_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_organization_legalentity       a116
on (a11.company_key = a116.row_key)
union
select'd_location' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_location       a117
on (a11.location_key = a117.row_key)
union
select'd_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_task_contacttype       a118
on (a11.reported_type_src_key = a118.row_key)
union
select'd_task_impact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_task_impact       a119
on (a11.impact_src_key = a119.row_key)
union
select'd_task_priority' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_task_priority       a120
on (a11.priority_src_key = a120.row_key)
union
select'd_task_urgency' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_task_urgency       a121
on (a11.urgency_src_key = a121.row_key)
union
select'dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.dh_assignment_group_tier_hierarchy       a122
on (a11.assignment_group_key = a122.user_group_tier_key)
union
select'dh_assignment_group_type_hierarchy' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.dh_assignment_group_type_hierarchy       a122
on (a11.assignment_group_key = a122.user_group_type_key)
union
select'd_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_contact_assigned_to       a123
on (a11.assigned_to_key = a123.row_key)
 union
 select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month        a124
on (a12.month_start_date_key = a124.row_key)
union
select'd_change_request' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_change_request      a125
on (a11.change_c_key = a125.row_key)
union
select'd_change_request_caused_by' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_change_request_caused_by       a125
on (a11.caused_by_change_key = a125.row_key)
union
select'd_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_calendar_time      a15
on   (a11.opened_time_key = a15.row_key)
join ldb.d_calendar_time_hour       a126
on  (a15.hour_24_format_num = a126.hour_24_format_num)
union
select 'dh_user_group_hierarchy' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
union
select 'dh_user_group_level1' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level1 a128 
on (a16.lev_1_key = a128.row_key) 
union
select 'dh_user_group_level2' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level2 a132 
on (a16.lev_2_key = a132.row_key) 
union
select 'dh_user_group_level3' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level3 a134 
on (a16.lev_3_key = a134.row_key) 
union
select 'dh_user_group_level4' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level4 a135 
on (a16.lev_4_key = a135.row_key)
union
select 'd_business_service' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join	ldb.d_business_service	a12
	  on 	(a11.business_service_key = a12.row_key)
union
select 'd_business_service_criticality' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join	ldb.d_business_service	a12
	  on 	(a11.business_service_key = a12.row_key)
join	ldb.d_business_service_criticality	a13
	  on 	(a12.criticality_key = a13.row_key)
union
select 'd_business_service_used_for' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join	ldb.d_business_service	a12
	  on 	(a11.business_service_key = a12.row_key)
join	ldb.d_business_service_used_for	a14
on 	(a12.used_for_src_key = a14.row_key)	  