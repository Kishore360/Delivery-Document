select 'ldb.f_problem_closed' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_internal_contact       a12
on (a11.closed_by_key=a12.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_calendar_time       a13
on (a11.opened_time_key=a13.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_internal_contact_assigned_to       a14
on (a11.assigned_to_key=a14.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key=a15.row_key)
union
select'ldb.dh_user_group_hierarchy' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11
 join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key=a15.row_key)
join ldb.dh_user_group_hierarchy       a16
on (a15.row_dn_key=a16.lev_0_key)
union
select'ldb.d_business_service' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_business_service       a17
on (a11.business_service_key=a17.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_calendar_date       a18
on (a11.closed_on_key=a18.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_configuration_item       a19
on (a11.configuration_item_key=a19.row_key)
union
select'ldb.d_internal_organization_pit_lead_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_internal_organization_pit_lead_c       a110
on (a11.assignment_group_for_pit_lead_c_key=a110.row_key)
union
select'ldb.d_incident' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_incident       a111
on (a11.problem_incident_c_key=a111.row_key)
union
select'ldb.d_problem' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_problem       a112
on (a11.problem_key=a112.row_key)
union
select'ldb.d_change_request' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_change_request       a113
on (a11.change_request_key=a113.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_internal_contact       a12
on (a11.closed_by_key=a12.row_key)
join ldb.d_internal_organization_department       a114
on (a12.department_key=a114.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_internal_contact       a12
on (a11.closed_by_key=a12.row_key)
join ldb.d_internal_contact_mdm       a115
on (a12.row_current_key=a115.row_current_key)
union
select'ldb.d_internal_contact_investigation_lead_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_internal_contact_investigation_lead_c       a117
on (a11.investigation_lead_c_key=a117.row_key)
union
select'ldb.d_location' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_location       a118
on (a11.location_key=a118.row_key)
union
select'ldb.d_lov_problem_category_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_lov_problem_category_c       a119
on (a11.category_src_key=a119.row_key)
union
select'ldb.d_problem_reported_type' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_problem_reported_type       a120
on (a11.reported_type_src_key=a120.row_key)
union
select'ldb.d_problem_impact' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_problem_impact       a121
on (a11.impact_src_key=a121.row_key)
union
select'ldb.d_problem_priority' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_problem_priority       a122
on (a11.priority_src_key=a122.row_key)
union
select'ldb.d_lov_problem_subcategory_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_lov_problem_subcategory_c       a123
on (a11.sub_category_src_key=a123.row_key)
union
select'ldb.d_problem_urgency' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_problem_urgency       a124
on (a11.urgency_src_key=a124.row_key)
union
select'ldb.d_lov_problem_rca_agebucket_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_lov_problem_rca_agebucket_c       a125
on (a11.rca_age_c_key=a125.row_key)
union
select'ldb.d_kb_knowledge_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_kb_knowledge_c       a126
on (a11.kb_knowledge_c_key=a126.row_key)
union
select'ldb.d_problem_related_problem_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_problem_related_problem_c       a127
on (a11.related_problem_c_key=a127.row_key)
union
select'ldb.d_request_item' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_request_item       a128
on (a11.request_item_c_key=a128.row_key)
union
select'ldb.d_location_assigned_to' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_internal_contact_assigned_to       a14
on (a11.assigned_to_key=a14.row_key)
join ldb.d_location_assigned_to       a129
on (a14.location_key=a129.row_key)
union
select'ldb.dh_user_group_level1' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
  join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key=a15.row_key)
join ldb.dh_user_group_hierarchy       a16
on (a15.row_dn_key=a16.lev_0_key)
join ldb.dh_user_group_level1       a130
on (a16.lev_1_key=a130.row_key)
union
select'ldb.dh_user_group_level2' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
  join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key=a15.row_key)
join ldb.dh_user_group_hierarchy       a16
on (a15.row_dn_key=a16.lev_0_key)
join ldb.dh_user_group_level2       a144
on (a16.lev_2_key=a144.row_key)
union
select'ldb.dh_user_group_level3' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11
  join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key=a15.row_key)
join ldb.dh_user_group_hierarchy       a16
on (a15.row_dn_key=a16.lev_0_key)
join ldb.dh_user_group_level3       a146
on (a16.lev_3_key=a146.row_key)
union
select'ldb.dh_user_group_level4' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
  join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key=a15.row_key)
join ldb.dh_user_group_hierarchy       a16
on (a15.row_dn_key=a16.lev_0_key)
join ldb.dh_user_group_level4       a148
on (a16.lev_4_key=a148.row_key)
union
select'ldb.d_business_service_criticality' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_business_service       a17
on (a11.business_service_key=a17.row_key)
join ldb.d_business_service_criticality       a131
on (a17.criticality_key=a131.row_key)
union
select'ldb.d_business_service_used_for' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_business_service       a17
on (a11.business_service_key=a17.row_key)
join ldb.d_business_service_used_for       a132
on (a17.used_for_src_key=a132.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11
 join ldb.d_calendar_date       a18
on (a11.closed_on_key=a18.row_key)
join ldb.d_calendar_month       a133
on (a18.month_start_date_key=a133.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_calendar_date       a18
on (a11.closed_on_key=a18.row_key)
join ldb.d_calendar_week       a134
on (a18.week_start_date_key=a134.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_calendar_date       a18
on (a11.closed_on_key=a18.row_key)
join ldb.d_calendar_quarter       a145
on (a18.quarter_start_date_key=a145.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_calendar_date       a18
on (a11.closed_on_key=a18.row_key)
join ldb.d_calendar_year       a147
on (a18.year_start_date_key=a147.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_incident       a111
on (a11.problem_incident_c_key=a111.row_key)
join ldb.d_incident_priority       a135
on (a111.priority_src_key=a135.row_key)
union
select'ldb.d_lov_problem_primary_closure_code_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_problem       a112
on (a11.problem_key=a112.row_key)
join ldb.d_lov_problem_primary_closure_code_c       a136
on (a112.primary_closure_code_src_c_key=a136.row_key)
union
select'ldb.d_problem_state' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_problem       a112
on (a11.problem_key=a112.row_key)
join ldb.d_problem_state       a137
on (a112.state_src_key=a137.row_key)
union
select'ldb.d_lov_problem_substatus_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_problem       a112
on (a11.problem_key=a112.row_key)
join ldb.d_lov_problem_substatus_c       a138
on (a112.substatus_src_c_key=a138.row_key)
union
select'ldb.d_lov_problem_reason_for_disqualification_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_problem       a112
on (a11.problem_key=a112.row_key)
join ldb.d_lov_problem_reason_for_disqualification_c       a139
on (a112.reason_for_disqualification_src_c_key=a139.row_key)
union
select'ldb.d_lov_problem_reason_for_non_implementation_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_problem       a112
on (a11.problem_key=a112.row_key)
join ldb.d_lov_problem_reason_for_non_implementation_c       a140
on (a112.reason_for_non_implementation_src_c_key=a140.row_key)
union
select'ldb.d_lov_problem_swat_code_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_problem       a112
on (a11.problem_key=a112.row_key)
join ldb.d_lov_problem_swat_code_c       a141
on (a112.swat_code_src_c_key=a141.row_key)
union
select'ldb.d_lov_problem_secondary_closure_code_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_problem       a112
on (a11.problem_key=a112.row_key)
join ldb.d_lov_problem_secondary_closure_code_c       a142
on (a112.secondary_closure_code_src_c_key=a142.row_key)
union
select'ldb.d_lov_problem_sub_status_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_problem       a112
on (a11.problem_key=a112.row_key)
join ldb.d_lov_problem_sub_status_c       a143
on (a112.sub_status_src_c_key=a143.row_key)






