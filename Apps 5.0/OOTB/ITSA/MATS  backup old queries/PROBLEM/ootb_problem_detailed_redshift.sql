 select'f_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 union
 select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month        a13
on (a12.month_start_date_key = a13.row_key)
union
select'd_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_calendar_time         a14
on (a11.opened_time_key = a14.row_key)
union
select'd_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_configuration_item         a15
on (a11.configuration_item_key = a15.row_key)
union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_contact         a16
on (a11.opened_by_key = a16.row_key)
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_contact         a16
on (a11.opened_by_key = a16.row_key)
join ldb.d_internal_contact_mdm         a17
on (a16.row_current_key = a17.row_current_key)
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_organization_group         a18
on (a11.assignment_group_key = a18.row_key)
union
select'd_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem         a19
on (a11.problem_key = a19.row_key)
union
select'd_problem_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_state         a19
on (a11.state_src_key = a19.row_key)
union
select'd_problem_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_reported_type        a110
on (a11.reported_type_src_key= a110.row_key)
union
select'd_problem_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_priority         a111
on (a11.priority_src_key= a111.row_key)
union
select'd_problem_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_urgency         a112
on (a11.urgency_src_key= a112.row_key)
union
select'd_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_contact_assigned_to         a113
on (a11.assigned_to_key = a113.row_key)
union
select'd_location_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
      join        ldb.d_internal_contact_assigned_to       a14
                  on         (a11.assigned_to_key = a14.row_key)
                join        ldb.d_location_assigned_to        a121
                  on         (a14.location_key = a121.row_key)
union
select'd_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
     join        ldb.d_location   a120
                  on         (a11.location_key = a120.row_key)
				  union
				  select'd_problem_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
				         join        ldb.d_problem_impact a115
                  on         (a11.impact_src_key = a115.row_key)
				  union
				   select'd_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
				   join        ldb.d_business_service a17
                  on         (a11.business_service_key = a17.row_key)
				  union
				  select'd_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
				    join        ldb.d_change_request  a111
                  on         (a11.change_request_key = a111.row_key)
				  union
				   select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
				      join        ldb.d_internal_organization_department             a112
                  on         (a11.opened_by_department_key = a112.row_key)
				 
			 union
			   select'd_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
			 join        ldb.d_calendar_time      a13
                  on         (a11.opened_time_key = a13.row_key)
                join        ldb.d_calendar_time_hour          a114
                  on         (a13.hour_24_format_num = a114.hour_24_format_num)
				  
				  union
				   select'd_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
				  join        ldb.d_business_service a17
                  on         (a11.business_service_key = a17.row_key)
                join        ldb.d_business_service_criticality             a123
                  on         (a17.criticality_key = a123.row_key)
				  union
				  select'd_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
				  join        ldb.d_business_service a17
                  on         (a11.business_service_key = a17.row_key)				  
				                  join        ldb.d_business_service_used_for             a124
                  on         (a17.used_for_src_key = a124.row_key)
				  union
				  select'dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11
				  	    join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
            join        ldb.dh_user_group_hierarchy    a16
                  on         (a15.row_dn_key = a16.lev_0_key)
				union
				  select'dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11
				 join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
            join        ldb.dh_user_group_hierarchy    a16
                  on         (a15.row_dn_key = a16.lev_0_key)
                join        ldb.dh_user_group_level1           a122
                  on         (a16.lev_1_key = a122.row_key)
				  union
				    select'dh_user_group_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11
				 join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
                 join        ldb.dh_user_group_hierarchy    a16
                  on         (a15.row_dn_key = a16.lev_0_key)
		         join        ldb.dh_user_group_level2           a126
                 on         (a16.lev_2_key = a126.row_key)
				 
				 union
				  select'dh_user_group_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11
				 join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
            join        ldb.dh_user_group_hierarchy    a16
                  on         (a15.row_dn_key = a16.lev_0_key)
                join        ldb.dh_user_group_level3           a122
                  on         (a16.lev_3_key = a122.row_key)
				  union
				    select'dh_user_group_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11
				 join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
                 join        ldb.dh_user_group_hierarchy    a16
                  on         (a15.row_dn_key = a16.lev_0_key)
		         join        ldb.dh_user_group_level4           a126
                 on         (a16.lev_4_key = a126.row_key)