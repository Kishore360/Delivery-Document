select'f_problem' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11
                join        ldb.d_internal_contact  a12
                  on         (a11.opened_by_key = a12.row_key)
union
select'd_calendar_time' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11				  
                join        ldb.d_calendar_time      a13
                  on         (a11.opened_time_key = a13.row_key)
union
select'd_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11
				  join        ldb.d_internal_contact_assigned_to      a14
                  on         (a11.assigned_to_key = a14.row_key)
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11
				  join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
union
select'dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11 
			  join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
 join        ldb.dh_user_group_hierarchy   a16
                  on         (a15.row_dn_key = a16.lev_0_key)
union
select'd_business_service' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11
				  join        ldb.d_business_service a17
                  on         (a11.business_service_key = a17.row_key)
union
select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11
				  join        ldb.d_calendar_date      a18
                  on         (a11.opened_on_key = a18.row_key)
union
select'd_configuration_item' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11
				  join        ldb.d_configuration_item            a19
                  on         (a11.configuration_item_key = a19.row_key)
union
select'd_problem' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11 
 join        ldb.d_problem  a110
                  on         (a11.problem_key = a110.row_key)
union
select'd_change_request' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11
				  join        ldb.d_change_request  a111
                  on         (a11.change_request_key = a111.row_key)
union
select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11
				  join        ldb.d_internal_organization_department            a112
                  on         (a11.opened_by_department_key = a112.row_key)
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11 
                join        ldb.d_internal_contact  a12
                  on         (a11.opened_by_key = a12.row_key)
 join        ldb.d_internal_contact_mdm    a113
                  on         (a12.row_current_key = a113.row_current_key)
 union
select'd_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11
                join        ldb.d_calendar_time      a13
                  on         (a11.opened_time_key = a13.row_key)
               join        ldb.d_calendar_time_hour         a114
                  on         (a13.hour_24_format_num = a114.hour_24_format_num)
union
select'd_problem_impact' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11 
 join        ldb.d_problem_impact a116
                  on         (a11.impact_src_key = a116.row_key)
union
select'd_problem_priority' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11 
 join        ldb.d_problem_priority a117
                  on         (a11.priority_src_key = a117.row_key)
union
select'd_problem_reported_type' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11
				  join        ldb.d_problem_reported_type a118
                  on         (a11.reported_type_src_key = a118.row_key)
union
select'd_problem_state' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11  
  join        ldb.d_problem_state     a119
                  on         (a11.state_src_key = a119.row_key)
union
select'd_problem_urgency' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11  
  join        ldb.d_problem_urgency               a120
                  on         (a11.urgency_src_key = a120.row_key)
union
select'd_location' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11  
  join        ldb.d_location   a122
                  on         (a11.location_key = a122.row_key)
union
select'd_location_assigned_to' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11  
				  join        ldb.d_internal_contact_assigned_to      a14
                  on         (a11.assigned_to_key = a14.row_key)
  join        ldb.d_location_assigned_to        a123
                  on         (a14.location_key = a123.row_key)
union
select'dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11 
				  join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
 join        ldb.dh_user_group_hierarchy   a16
                  on         (a15.row_dn_key = a16.lev_0_key)
 join        ldb.dh_user_group_level1          a124
                  on         (a16.lev_1_key = a124.row_key)
union
select'd_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11 
				  join        ldb.d_business_service a17
                  on         (a11.business_service_key = a17.row_key)
 join        ldb.d_business_service_criticality            a125
                  on         (a17.criticality_key = a125.row_key)
union
select'd_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11  
				  join        ldb.d_business_service a17
                  on         (a11.business_service_key = a17.row_key)
  join        ldb.d_business_service_used_for           a126
                  on         (a17.used_for_src_key = a126.row_key)
union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11  
				  join        ldb.d_calendar_date      a18
                  on         (a11.opened_on_key = a18.row_key) 
  join        ldb.d_calendar_month a127
                  on         (a18.month_start_date_key = a127.row_key)
union
select'd_calendar_week' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11 
				  join        ldb.d_calendar_date      a18
                  on         (a11.opened_on_key = a18.row_key) 
  join        ldb.d_calendar_week    a128
                  on         (a18.week_start_date_key = a128.row_key)
 union
select'dh_user_group_level2' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11
				  join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
 join        ldb.dh_user_group_hierarchy   a16
                  on         (a15.row_dn_key = a16.lev_0_key)
 join        ldb.dh_user_group_level2          a129
                  on         (a16.lev_2_key = a129.row_key)
union
select'd_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11 
				  join        ldb.d_calendar_date      a18
                  on         (a11.opened_on_key = a18.row_key)
 join        ldb.d_calendar_quarter                a130
                  on         (a18.quarter_start_date_key = a130.row_key)
union
select'dh_user_group_level3' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11 
				  join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
 join        ldb.dh_user_group_hierarchy   a16
                  on         (a15.row_dn_key = a16.lev_0_key)
 join        ldb.dh_user_group_level3          a131
                  on         (a16.lev_3_key = a131.row_key)
union
select'd_calendar_year' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11
				  join        ldb.d_calendar_date      a18
                  on         (a11.opened_on_key = a18.row_key)
				  join        ldb.d_calendar_year      a132
                  on         (a18.year_start_date_key = a132.row_key)
union
select'dh_user_group_level4' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem   a11 
				  join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
 join        ldb.dh_user_group_hierarchy   a16
                  on         (a15.row_dn_key = a16.lev_0_key)
 join        ldb.dh_user_group_level4          a133
                  on         (a16.lev_4_key = a133.row_key)
