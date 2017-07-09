select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
union
select 'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_customer a12
on (a11.customer_key=a12.row_key)
union
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_internal_contact a13
on (a11.opened_by_key=a13.row_key)
union
select 'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_calendar_time a14
on (a11.opened_time_key=a14.row_key)
union
select 'ldb.dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.dh_assignment_group_tier_hierarchy a15
on (a11.assignment_group_key=a15.user_group_tier_key)
union
select 'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key=a16.row_key)
union
select 'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_incident a17
on (a11.incident_key=a17.row_key)
union
select 'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_configuration_item a18
on (a11.configuration_item_key=a18.row_key)
union
select 'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_calendar_date a19
on (a11.opened_on_key=a19.row_key)
union
select 'ldb.d_lov_alarm_source_view_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_lov_alarm_source_view_c a110
on (a11.alarm_source_c_key=a110.row_key)
union
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_internal_contact a111
on (a11.assigned_to_key=a111.row_key)
union
select 'ldb.d_lov_switch_close_code_view_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_lov_switch_close_code_view_c a112
on (a11.switch_close_code_c_key=a112.row_key)
union
select 'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 join ldb.d_customer a12 on	(a11.customer_key=a12.row_key)
join ldb.d_customer_mdm a113
on (a12.row_current_key=a113.row_current_key)
union
select 'ldb.d_lov_customer_impacted_view_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_lov_customer_impacted_view_c a114
on (a11.customer_impacted_c_key=a114.row_key)
union
select 'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_internal_organization_department a115
on (a11.opened_by_department_key=a115.row_key)
union
select 'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 join ldb.d_internal_contact a13 on (a11.opened_by_key=a13.row_key)
join ldb.d_internal_contact_mdm a116
on (a13.row_current_key=a116.row_current_key)
union
select 'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 join ldb.d_calendar_time a14 on (a11.opened_time_key=a14.row_key)
join ldb.d_calendar_time_hour a117
on (a14.hour_24_format_num=a117.hour_24_format_num)
union
select 'ldb.d_incident_agebucket' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_incident_agebucket a118
on (a11.age_key=a118.row_key)
union
select 'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_incident_close_code a119
on (a11.close_code_src_key=a119.row_key)
union
select 'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_incident_state a120
on (a11.state_src_key=a120.row_key)
union
select 'ldb.d_location_market' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_location_market a121
on (a11.market_c_key=a121.row_key)
union
select 'ldb.d_incident_agebucket_secondary' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_incident_agebucket_secondary a122
on (a11.secondary_age_c_key=a122.row_key)
union
select 'ldb.d_location_site' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_location_site a123
on (a11.site_c_key=a123.row_key)
union
select 'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_task_impact a124
on (a11.impact_src_key=a124.row_key)
union
select 'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_location a125
on (a11.location_key=a125.row_key)
union
select 'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_task_priority a126
on (a11.priority_src_key=a126.row_key)
union
select 'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_task_urgency a127
on (a11.urgency_src_key=a127.row_key)
union
select 'ldb.d_lov_type_view_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_lov_type_view_c a128
on (a11.type_c_key=a128.row_key)
union
select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 join ldb.d_calendar_date a19 on (a11.opened_on_key=a19.row_key)
join ldb.d_calendar_month a129
on (a19.month_start_date_key=a129.row_key)
union
select 'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 join ldb.d_calendar_date a19 on (a11.opened_on_key=a19.row_key)
join ldb.d_calendar_week a130
on (a19.week_start_date_key=a130.row_key)

union
select 'ldb.d_location' as Table_Name, count(a.row_key) Row_Count
from  ldb.f_incident a 
join ldb.d_location b
on (a.site_c_key =b.row_key)
union
select 'ldb.d_lov' as Table_Name, count(a.row_key) Row_Count
from  ldb.f_incident a 
join wow_mdwdb.d_lov b
on (a.secondary_age_c_key =b.row_key)
union
select 'ldb.d_location 1' as Table_Name, count(a.row_key) Row_Count
from  ldb.f_incident a 
join ldb.d_location  b
on (a.market_c_key =b.row_key)
union
select 'ldb.d_lov 1' as Table_Name, count(a.row_key) Row_Count
from  ldb.f_incident a 
join wow_mdwdb.d_lov  b
on (a.customer_impacted_c_key =b.row_key)
union
select 'ldb.d_lov 2' as Table_Name, count(a.row_key) Row_Count
from  ldb.f_incident a 
join wow_mdwdb.d_lov  b
on (a.type_c_key=b.row_key)