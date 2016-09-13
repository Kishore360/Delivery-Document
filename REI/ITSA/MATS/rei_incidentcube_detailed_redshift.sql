SELECT 'f_incident',count(*) as cnt from ldb.f_incident  union all
SELECT 'd_internal_organization_legalentity',count(*) as cnt from ldb.f_incident a11 join ldb.d_internal_organization_legalentity a12  on (a11.company_key = a12.row_key) union all 

SELECT 'd_customer',count(*) as cnt from ldb.f_incident a11 join ldb.d_customer a13  on (a11.customer_key = a13.row_key) union all 

SELECT 'd_internal_organization_department',count(*) as cnt from ldb.f_incident a11 join ldb.d_internal_organization_department a14  on (a11.opened_by_department_key = a14.row_key) union all 

SELECT 'd_internal_contact',count(*) as cnt from ldb.f_incident a11 join ldb.d_internal_contact a15 on (a11.opened_by_key = a15.row_key) union all 

SELECT 'd_calendar_time',count(*) as cnt from ldb.f_incident a11 join ldb.d_calendar_time a16  on (a11.opened_time_key = a16.row_key) union all 

SELECT 'dh_assignment_group_tier_hierarchy',count(*) as cnt from ldb.f_incident a11 join ldb.dh_assignment_group_tier_hierarchy a17  on (a11.assignment_group_key = a17.user_group_tier_key) union all 

SELECT 'dh_assignment_group_type_hierarchy',count(*) as cnt from ldb.f_incident a11 join ldb.dh_assignment_group_type_hierarchy a18  on (a11.assignment_group_key = a18.user_group_type_key) union all 

SELECT 'd_configuration_item',count(*) as cnt from ldb.f_incident a11 join ldb.d_configuration_item a19  on (a11.configuration_item_key = a19.row_key) union all 

SELECT 'd_calendar_date',count(*) as cnt from ldb.f_incident a11 join ldb.d_calendar_date a110  on (a11.opened_on_key = a110.row_key) union all 

SELECT 'd_internal_organization_group_c',count(*) as cnt from ldb.f_incident a11 join ldb.d_internal_organization_group_c a111  on (a11.assignment_group_key = a111.row_key) union all 

SELECT 'd_internal_contact_mdm',count(*) as cnt from ldb.f_incident a11 join ldb.d_internal_contact a15 on (a11.opened_by_key = a15.row_key) join ldb.d_internal_contact_mdm a112  on (a15.row_current_key = a112.row_current_key) union all 

SELECT 'd_employee_location',count(*) as cnt from ldb.f_incident a11 join ldb.d_internal_contact a15 on (a11.opened_by_key = a15.row_key) join ldb.d_internal_contact_mdm a112  on (a15.row_current_key = a112.row_current_key) join ldb.d_employee_location a113  on (a112.location_key = a113.row_key) union all 

SELECT 'd_incident',count(*) as cnt from ldb.f_incident a11 join ldb.d_incident a114  on (a11.incident_key = a114.row_key) union all 

SELECT 'd_location',count(*) as cnt from ldb.f_incident a11 join ldb.d_location a115  on (a11.location_key = a115.row_key) union all 

SELECT 'd_location_clean_c',count(*) as cnt from ldb.f_incident a11 join ldb.d_location a115  on (a11.location_key = a115.row_key)  join ldb.d_location_clean_c a116  on (a115.location_number = a116.clean_location) union all 

SELECT 'd_internal_contact',count(*) as cnt from ldb.f_incident a11 join ldb.d_internal_contact a117  on (a11.assigned_to_key = a117.row_key) union all 

SELECT 'd_internal_organization_group',count(*) as cnt from ldb.f_incident a11 join ldb.d_internal_organization_group a118  on (a11.assignment_group_key = a118.row_key) union all 

SELECT 'd_customer_mdm',count(*) as cnt from ldb.f_incident a11 join ldb.d_customer a13  on (a11.customer_key = a13.row_key) join ldb.d_customer_mdm a119  on (a13.row_current_key = a119.row_current_key) union all 

SELECT 'd_domain',count(*) as cnt from ldb.f_incident a11 join ldb.d_domain a120  on (a11.domain_key = a120.row_key) union all 

SELECT 'd_calendar_time_hour',count(*) as cnt from ldb.f_incident a11 join ldb.d_calendar_time a16  on (a11.opened_time_key = a16.row_key) join ldb.d_calendar_time_hour a121  on (a16.hour_24_format_num = a121.hour_24_format_num) union all 

SELECT 'd_incident_category',count(*) as cnt from ldb.f_incident a11 join ldb.d_incident_category a122  on (a11.category_src_key = a122.row_key) union all 

SELECT 'd_incident_close_code',count(*) as cnt from ldb.f_incident a11 join ldb.d_incident_close_code a123  on (a11.close_code_src_key = a123.row_key) union all 

SELECT 'd_incident_severity',count(*) as cnt from ldb.f_incident a11 join ldb.d_incident_severity a124  on (a11.severity_src_key = a124.row_key) union all 

SELECT 'd_incident_state',count(*) as cnt from ldb.f_incident a11 join ldb.d_incident_state a125  on (a11.state_src_key = a125.row_key) union all 

SELECT 'd_incident_subcategory',count(*) as cnt from ldb.f_incident a11 join ldb.d_incident_subcategory a126  on (a11.sub_category_src_key = a126.row_key) union all 

SELECT 'd_task_impact',count(*) as cnt from ldb.f_incident a11 join ldb.d_task_impact a127  on (a11.impact_src_key = a127.row_key) union all 

SELECT 'd_task_priority',count(*) as cnt from ldb.f_incident a11 join ldb.d_task_priority a128  on (a11.priority_src_key = a128.row_key) union all 

SELECT 'd_task_contacttype',count(*) as cnt from ldb.f_incident a11 join ldb.d_task_contacttype a129  on (a11.reported_type_src_key = a129.row_key) union all 

SELECT 'd_task_urgency',count(*) as cnt from ldb.f_incident a11 join ldb.d_task_urgency a130  on (a11.urgency_src_key = a130.row_key) union all 

SELECT 'd_assignment_group_director_c',count(*) as cnt from ldb.f_incident a11 join ldb.d_internal_organization_group_c a111  on (a11.assignment_group_key = a111.row_key) join ldb.d_assignment_group_director_c a131  on (a111.director_c_key = a131.director_c_key) union all 

SELECT 'd_assignment_group_manager_c',count(*) as cnt from ldb.f_incident a11 join ldb.d_internal_organization_group_c a111  on (a11.assignment_group_key = a111.row_key) join ldb.d_assignment_group_manager_c a132  on (a111.manager_c_key = a132.manager_c_key) union all 

SELECT 'd_calendar_month',count(*) as cnt from ldb.f_incident a11 join ldb.d_calendar_date a110  on (a11.opened_on_key = a110.row_key) join ldb.d_calendar_month a133  on (a110.month_start_date_key = a133.row_key);
union
select 'ldb.dh_user_group_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
union
select 'ldb.dh_user_group_level1 a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level1 a128 
on (a16.lev_1_key = a128.row_key) 
union
select 'ldb.dh_user_group_level2 a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level2 a132 
on (a16.lev_2_key = a132.row_key) 
union
select 'ldb.dh_user_group_level3 a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level3 a134 
on (a16.lev_3_key = a134.row_key) 
union
select 'ldb.dh_user_group_level4 a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level4 a135 
on (a16.lev_4_key = a135.row_key)